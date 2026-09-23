# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Critical: most source code is not extracted yet

The working directory contains almost no editable source. What is on disk:

- `5520.rar` (137 MB) holds the real project: `5520/jingsai/` (Spring Boot backend) and `5520/front-end/` (Vue 2 frontend, including `src/`).
- `front-end/` on disk has only `dist/`, `node_modules/`, and config files. There is **no `front-end/src/`** and no `vue.config.js`.
- `jingsai/` does not exist on disk at all, though `.idea/modules.xml` references it.

Before editing anything, extract the archive. Windows `tar.exe` (bsdtar) reads RAR5 here; Python `rarfile` can list entries but cannot decompress without an unrar backend.

```bash
/c/Windows/System32/tar.exe -xf 5520.rar            # whole archive
/c/Windows/System32/tar.exe -xf 5520.rar "5520/jingsai/pom.xml"   # single entry
```

`其它文件/必读：项目说明.txt` is the original author's readme. It says the backend lives in `jingsai` and the frontend ships as `front-end.zip`, and it lists demo logins (all password `123456`): student `159951159`, teacher `445393889`, college admin `1212714291`, school admin `admin`.

## Commands

Frontend, from `front-end/` (Vue CLI 3, no lint or test setup):

```bash
npm run serve     # dev server
npm run build     # production build into dist/
```

Backend is Maven with the Spring Boot parent, no wrapper committed, Java 8:

```bash
mvn spring-boot:run              # from the extracted jingsai/
mvn test                         # whole suite; only spring-boot-starter-test is present
mvn test -Dtest=ClassName#method # single test
```

`node-v14.21.3-x64.msi` sits in `其它文件/`, which signals the intended Node version for this dependency set.

## Database

MySQL, schema `jingsai`, 14 tables. Two scripts exist and they are **not** identical: `其它文件/数据库脚本.sql` is the fuller one at 767 inserts, `其它文件/jingsai.sql` has 258. Both drop and recreate the database at the top, so running either destroys existing data.

Connection settings live in `jingsai/src/main/resources/application.yml`. That file points at a **remote production host**, `8.134.167.110:3306`, with a committed root password. Repoint it to a local MySQL before running anything, and treat the committed credential as compromised.

JPA runs with `ddl-auto: update`, so entity edits mutate the live schema on boot.

## Architecture

Spring Boot 2.4 backend, Vue 2 SPA frontend, talking over plain HTTP JSON with CORS fully open (`CorsConfig` allows any origin, header, and method).

**Four roles drive everything.** `student`, `teacher`, `college` (faculty admin), and `admin` (school admin) each have their own table, their own entity, their own controller, and their own mirrored set of Vue views under `src/views/<role>/`. Expect to touch four parallel places when changing a cross-role feature. The role string is called `token` throughout, which is confusing: it is a role name, not a credential.

**Domain flow.** A `comp` (competition) is published, then a `college` applies to it via `college_comp`. A `teacher` creates a `project` under a comp, and students and teachers join through `student_project` and `teacher_project`, each carrying an `apply_or_join` state. Students submit `work` with attached `work_file` rows, a college scores it, and `awards` records the result. `notice` and `message` handle announcements and per-user inbox.

**Backend layering** under `com.sang.subjectcompetition`: `controller` → `service` interface → `service.impl` → `respository` (note that spelling) for Spring Data JPA, plus a thin `dao` package of tk-mybatis mappers with inline SQL for the few deletes JPA made awkward. Mapper XML sits in `resources/Mapper/`. So JPA and MyBatis coexist, and `StartApplication` carries both `@MapperScan` and `@EnableScheduling`.

`config/TimeTask` advances `comp_state` on a cron schedule as application and occurrence dates pass. Competition state is therefore time-driven, not purely user-driven, and `WebMvcConfig` is entirely commented out.

**Auth is minimal and not production-grade.** `UserServiceImpl.loginUser` branches on the role string and does a plaintext username-and-password equality lookup per role table. There is no hashing, no session, and no server-side token. Captcha state lives in a static `HashMap` in `CaptureConfig`, keyed by a client-supplied `key`. On the client, `router.js` guards routes purely from `sessionStorage` values `islogin` and `token`, so every access control decision is client-side and trivially bypassed. Any real hardening means adding server-side authorization, which does not exist today.

**Responses are inconsistent.** `common/Result` defines a `code`/`msg`/`data` envelope, but login returns a separate `LoginResult` with numeric codes (2003 success, 2001 failure) and many endpoints return entities directly. Check the specific controller rather than assuming an envelope.

**Frontend API calls.** Views import the base URL from `main.js` with `import api from "../../main"`, where `main.js` exports a hardcoded `var url = "http://8.134.167.110:8080"`. Calls are then `this.$axios.get(api + "/path/" + id)`. The axios wrapper at `src/utils/request.js` is dead code and broken: its `baseURL` is the malformed `'http:localhost：8080'` with a full-width colon, it registers the response handler on `interceptors.request` by mistake, and it imports a Vue internal path. Do not adopt it without rewriting. Changing the backend host means editing `main.js`.

Uploads go to `c:/subject` on Windows or `/usr/subject` on Linux, chosen at runtime by OS sniffing in `FileController` and `UploadFileUtils`. Downloads are served by database `work_file` id. The `file/` directory in the working tree holds a few stray uploaded logos.

Entities carry three annotation systems at once: JPA for persistence, Hutool `@Alias` for Excel import column mapping, and fastjson `@JSONField(serialize = false)` plus Jackson `@JsonIgnore` to break bidirectional serialization loops. Keep both ignore annotations when adding a back-reference, or JSON serialization will recurse.

Comments, log output, and user-facing strings are in Chinese. Match that when editing existing files.

# ManageIQ debug image

This image is intended to be run in a namesapce which is also running an instance of the [ManageIQ pods](https://github.com/manageiq/manageiq-pods) project. The required environment is described in job_template.yaml.

## Running the image

The following command will run the job in the current namespace with the default values for the database and app secrets.
```bash
$ oc process -f job_template.yaml | oc apply -f -
```

This will result in a job which runs to completion. You can then retrieve the results of the job from the pod logs.

```bash
$ oc get jobs
NAME                 COMPLETIONS   DURATION   AGE
env-debug-v0gy8lbv   1/1           25s        5m25s
env-debug-vhyv13ha   1/1           2m12s      11m

$ oc get pods
NAME                                READY     STATUS      RESTARTS   AGE
1-event-handler-5cbf78576d-k2h6r    1/1       Running     0          125m
1-generic-656d9bb465-4zgsw          1/1       Running     0          125m
1-generic-656d9bb465-qxh84          1/1       Running     0          125m
1-priority-59dcc6b5d7-mwlnx         1/1       Running     0          125m
1-priority-59dcc6b5d7-qszh7         1/1       Running     0          125m
1-remote-console-7b6dfbc77b-4fqzk   1/1       Running     0          125m
1-reporting-7d9b88b56f-f4vhb        1/1       Running     0          125m
1-reporting-7d9b88b56f-hh646        1/1       Running     0          125m
1-schedule-5b6c9cbd6c-rlnd5         1/1       Running     0          125m
1-ui-577c57dd6f-7bn6c               1/1       Running     0          125m
1-web-service-7694b9db46-twr5h      1/1       Running     0          125m
env-debug-v0gy8lbv-qtk2j            0/1       Completed   0          5m23s
env-debug-vhyv13ha-88ps6            0/1       Completed   0          11m
httpd-69bb8d675f-zj78r              1/1       Running     0          132m
memcached-6ccb6598d4-6kpsv          1/1       Running     0          132m
orchestrator-5cf6cfcc77-rw8tm       1/1       Running     0          132m
postgresql-684c6598d4-rk9ln         1/1       Running     0          132m

$ oc logs env-debug-v0gy8lbv-qtk2j
/var/www/miq/vmdb /
====== bin/rake environment ======
{"@timestamp":"2020-07-01T18:09:39.040186 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"debug","message":"PostgreSQLAdapter#log_after_checkout, connection_pool: size: 5, connections: 1, in use: 1, waiting_in_queue: 0"}
{"@timestamp":"2020-07-01T18:09:39.125985 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"MIQ(MiqServer.load_or_generate_guid) Generated MiqServer GUID 441ae173-93b5-4c1e-bd4e-151597620f38"}
{"@timestamp":"2020-07-01T18:09:39.210212 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"MIQ(Vmdb::Loggers.apply_config) Log level for azure.log has been changed to [WARN]"}
{"@timestamp":"2020-07-01T18:09:39.210562 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"MIQ(Vmdb::Loggers.apply_config) Log level for vim.log has been changed to [WARN]"}
{"@timestamp":"2020-07-01T18:09:39.328757 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"MIQ(SessionStore) Using session_store: ActionDispatch::Session::MemCacheStore"}
{"@timestamp":"2020-07-01T18:09:39.426461 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"debug","message":"Dalli::Server#connect 172.30.82.209:11211"}
{"@timestamp":"2020-07-01T18:09:39.617845 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"Initializing Environment for API"}
{"@timestamp":"2020-07-01T18:09:39.618097 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":""}
{"@timestamp":"2020-07-01T18:09:39.618205 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"Static Configuration"}
{"@timestamp":"2020-07-01T18:09:39.618328 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"  module                  : api"}
{"@timestamp":"2020-07-01T18:09:39.618418 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"  name                    : API"}
{"@timestamp":"2020-07-01T18:09:39.618504 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"  description             : REST API"}
{"@timestamp":"2020-07-01T18:09:39.618585 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":""}
{"@timestamp":"2020-07-01T18:09:39.618664 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"Dynamic Configuration"}
{"@timestamp":"2020-07-01T18:09:39.621754 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"  token_ttl               : 10.minutes"}
{"@timestamp":"2020-07-01T18:09:39.621927 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"  authentication_timeout  : 30.seconds"}
{"@timestamp":"2020-07-01T18:09:39.622024 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"  max_results_per_page    : 1000"}
{"@timestamp":"2020-07-01T18:09:39.622174 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"info","message":"MIQ(Vmdb::Initializer.init) - Program Name: bin/rake, PID: 15, ENV['EVMSERVER']: "}
{"@timestamp":"2020-07-01T18:09:39.622475 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":15,"tid":"2b1390423960","level":"debug","message":"PostgreSQLAdapter#log_after_checkin, connection_pool: size: 5, connections: 1, in use: 0, waiting_in_queue: 0"}

real	0m9.373s
user	0m4.808s
sys	0m3.446s
====== ruby -e '' ======

real	0m0.245s
user	0m0.097s
sys	0m0.043s
====== bundle exec /bin/true ======
`/` is not writable.
Bundler will use `/tmp/bundler20200701-20-1y444wl20' as your home directory temporarily.
`/` is not writable.
Bundler will use `/tmp/bundler20200701-20-1h06zps20' as your home directory temporarily.

real	0m0.303s
user	0m0.177s
sys	0m0.049s
====== bundle exec ruby -e '' -r active_record ======
`/` is not writable.
Bundler will use `/tmp/bundler20200701-21-1velef821' as your home directory temporarily.
`/` is not writable.
Bundler will use `/tmp/bundler20200701-21-wga5kx21' as your home directory temporarily.

real	0m1.199s
user	0m0.852s
sys	0m0.190s
====== bin/rails r 'puts EvmDatabase.ping' ======
{"@timestamp":"2020-07-01T18:09:49.109688 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"debug","message":"PostgreSQLAdapter#log_after_checkout, connection_pool: size: 5, connections: 1, in use: 1, waiting_in_queue: 0"}
{"@timestamp":"2020-07-01T18:09:49.467115 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"MIQ(Vmdb::Loggers.apply_config) Log level for azure.log has been changed to [WARN]"}
{"@timestamp":"2020-07-01T18:09:49.467688 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"MIQ(Vmdb::Loggers.apply_config) Log level for vim.log has been changed to [WARN]"}
{"@timestamp":"2020-07-01T18:09:49.618609 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"MIQ(SessionStore) Using session_store: ActionDispatch::Session::MemCacheStore"}
{"@timestamp":"2020-07-01T18:09:49.736698 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"debug","message":"Dalli::Server#connect 172.30.82.209:11211"}
{"@timestamp":"2020-07-01T18:09:49.883566 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"Initializing Environment for API"}
{"@timestamp":"2020-07-01T18:09:49.883779 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":""}
{"@timestamp":"2020-07-01T18:09:49.883871 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"Static Configuration"}
{"@timestamp":"2020-07-01T18:09:49.883960 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"  module                  : api"}
{"@timestamp":"2020-07-01T18:09:49.884076 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"  name                    : API"}
{"@timestamp":"2020-07-01T18:09:49.884224 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"  description             : REST API"}
{"@timestamp":"2020-07-01T18:09:49.884337 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":""}
{"@timestamp":"2020-07-01T18:09:49.884417 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"Dynamic Configuration"}
{"@timestamp":"2020-07-01T18:09:49.886967 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"  token_ttl               : 10.minutes"}
{"@timestamp":"2020-07-01T18:09:49.887139 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"  authentication_timeout  : 30.seconds"}
{"@timestamp":"2020-07-01T18:09:49.887232 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"  max_results_per_page    : 1000"}
{"@timestamp":"2020-07-01T18:09:49.887383 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"info","message":"MIQ(Vmdb::Initializer.init) - Program Name: bin/rails, PID: 23, ENV['EVMSERVER']: "}
{"@timestamp":"2020-07-01T18:09:49.887655 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"debug","message":"PostgreSQLAdapter#log_after_checkin, connection_pool: size: 5, connections: 1, in use: 0, waiting_in_queue: 0"}
{"@timestamp":"2020-07-01T18:09:51.658683 ","hostname":"env-debug-v0gy8lbv-qtk2j","pid":23,"tid":"2af4fec1596c","level":"debug","message":"PostgreSQLAdapter#log_after_checkout, connection_pool: size: 5, connections: 1, in use: 1, waiting_in_queue: 0"}
0.3246553000280983

real	0m9.535s
user	0m5.527s
sys	0m2.903s
/
```

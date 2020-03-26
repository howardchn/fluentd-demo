```
docker-compose up
```

The demo service doesn't feed logs into ES, but running `docker-compose restart demo` fix the issue. I suspect the reason is the `depends_on`. The `demo` depends on for example `fluentd`, but the container startup but not ready, so the log driver cannot load successfully. When I restart the `demo` container, the driver is ready so that the logs can flow into fluentd, then into ES.
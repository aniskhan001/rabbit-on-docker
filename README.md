# Rabbit on Docker [with broker definition]

Simple docker-compose setup for RabbitMQ instance with option to load broker definitions

### How ro run?
Use `run.sh` to build and/or dpeloy RabbitMQ instance on Docker

1. Export broker definition from your Rabbit instance to `rabbit-config-template.json`
2. `./run.sh -v vhost_name`

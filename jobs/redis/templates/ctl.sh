#!/usr/bin/env bash

RUN_DIR=/var/vcap/sys/run/redis
LOG_DIR=/var/vcap/sys/log/redis

case $1 in

  start)
    mkdir -p $RUN_DIR $LOG_DIR
    chown -R vcap:vcap $RUN_DIR $LOG_DIR

    /var/vcap/packages/redis/bin/redis-server \
    /var/vcap/jobs/redis/redis.conf \
    1>> $LOG_DIR/redis.out \
    2>> $LOG_DIR/redis.err

    ;;

  stop)
    /var/vcap/packages/redis/bin/redis-cli shutdown

    ;;

  *)
    echo "Usage: ctl {start|stop}" ;;

esac

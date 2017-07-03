#!/bin/bash
LISTEN_PORT=83 # Slackからの通知を聞くための他で使っていないポート
BOT_NAME="lita-slack" # dockerコンテナ名
REDIS_PATH=tmp_redis # redisのrdbファイルに使う適当なディレクトリ

if ! docker ps|grep -q litaio/redis; then
  if docker ps -a|grep -q litaio/redis; then
    docker start redis
  else
    docker run -d --name redis --restart always -v $REDIS_PATH:/var/lib/redis litaio/redis
  fi
fi

if docker ps -a|grep -q lita-slack; then
  docker stop $BOT_NAME
  docker rm $BOT_NAME
fi

docker build -t $BOT_NAME .
docker run -d --name $BOT_NAME --link redis --restart always -p $LISTEN_PORT:8080 $BOT_NAME

# A Lita-Slack(w/Docker) Starter Kit
Slack botを手元の環境で用意するための最短スターターキット

## Slack? Lita? Docker？

- [Slack: Where work happens (slack.com)](https://slack.com/)
- [Lita: ChatOps for Ruby - Lita.io (www.lita.io)](https://www.lita.io/)
- [Docker - Build, Ship, and Run Any App, Anywhere (www.docker.com)](https://www.docker.com/)

## 使いかた

### 手元の環境にDockerを用意
- [Docker For Mac | Docker (www.docker.com)](https://www.docker.com/docker-mac)
- [Docker For Windows | Docker (www.docker.com)](https://www.docker.com/docker-windows)

etc...

### 手元の環境にこのリポジトリをclone

```bash
git clone git@github.com:shinmiy/lita-starter-kit.git
```

### SlackでLita用のトークンを取得する
- ***.slack.com/app/manage よりLita用アカウントを作って用意します

- `lita_config.rb` にトークンを追加します
```ruby
config.adapters.slack.token = "YOUR TOKEN HERE"
```

### おもむろに起動
`start.sh` でDocker関連の設定を行います。
```bash
LISTEN_PORT=83 # Slackからの通知を聞くための他で使っていないポート
BOT_NAME="lita-slack" # dockerコンテナ名
REDIS_PATH=tmp_redis # redisで使う適当なディレクトリ
```

起動。
```
./start.sh
```
## Botをいじる

`bot.rb` に実装部分が入ります。
新しい機能を追加したら、都度 `start.sh` の実行が必要です。
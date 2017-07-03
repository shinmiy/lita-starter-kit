require './bot.rb'

Lita.configure do |config|
  config.redis[:host] = "redis"

  # lita-slack設定
  config.robot.adapter        = :slack
  config.adapters.slack.token = "ここにトークンを入力"
end

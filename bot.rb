module Lita
  module Handlers
    class MyBot < Handler

      route(
          /ping/i, # 反応するコメントの正規表現
          :ping, # 対応するメソッド名
          command: true # trueの場合は@やDMなどbotに対する直接のメッセージ以外は反応しない
      )

      # 複数あってもよい。
      # route(
      #     /hoge/i,
      #     :fuga,
      #     command: true
      # )

      def ping(response)
        response.reply 'pong'
      end

      Lita.register_handler(self)
    end
  end
end

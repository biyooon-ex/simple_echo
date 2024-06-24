# SimpleEcho

**受け取ったJSONをそのまま返却する HTTP Server**

**zcamex では画像返却用の HTTP Backend として利用**

## 動作環境
- Erlang 26 以降
- Elixir 1.16 以降

## 準備

```sh
git clone git@github.com:b5g-ex/simple_echo.git
cd simple_echo
mix deps.get
```

## 起動

```sh
# 4444 port で HTTP Server を起動
mix run --no-halt
```

## API
### POST /echo
#### Request
- JSON
#### Response
- Received JSON

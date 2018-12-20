# IDm Reader
FeliCaリーダーからIdmを読み取って所定のエンドポイントに送りつけるモジュール

## Requirements
- Python 2.7.4
- pip

## Setup
```shell
$ pip install -r requirements.txt # 必要モジュールのインストール
$ MASTER_HOST="http://localhost:3000/api/v1/..." # Masterのエンドポイント
$ python app.py # 起動
```

## API
読み取りリクエストを受け付けると
```
{"message": "accepted"} # 202
```
JSON読み取りエラー
```
{"message": "bad json format"} # 400
```

読み取り完了後指定のアドレスにwebhook
読み取り成功
```
{"message": "success"
"body": {"idm" "0x0", "purchase_id" 1}}
```

FeliCaリーダーエラー（使用中・接続されてない・ドライバエラー）
```
{"message": "FeliCa device error"
"body": {"idm":  null, "purchase_id" 1}}
```
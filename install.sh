sudo apt-get update -y && sudo apt-get install curl nginx -y

wget https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh

sudo bash install-release.sh

# JSON配置内容

CONFIG='{
  "inbounds": [
    {
      "port": 16832,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "7c66a1d8-479f-4198-9467-69a186acdc80",
            "alterId": 0
          }
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    }
  ]
}'

# 创建目录（如果尚不存在）

sudo mkdir -p /usr/local/etc/v2ray

# 写入配置到文件

echo "$CONFIG" | sudo tee /usr/local/etc/v2ray/config.json > /dev/null

sudo systemctl enable v2ray
sudo systemctl start v2ray
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && sudo ./bbr.sh
sudo systemctl restart v2ray

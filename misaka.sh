#!/bin/bash




# X2
cat <<EOF > /Xlano.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": ${PORT},
            "protocol": "$TYPE",
            "settings": {
                "clients": [
                    {
                        "id": "$UUID"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/$UUID-$TYPE"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF



/usr/local/bin/kano -config=/Xlano.json 

#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
#refreshing Rclone
rclone version
#serving to port 8080
rclone serve http "EncryptPlex:" --addr :$PORT --vfs-cache-mode=full --buffer-size=128M --vfs-read-ahead=1024M --vfs-cache-max-size=200G --vfs-cache-max-age=24h --cache-dir "/.config/rclone/" --dir-cache-time 1000h --poll-interval 15s --timeout 1h --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36"


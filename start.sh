#!/bin/bash
cloudflared tunnel --no-autoupdate --url http://localhost:8188 &
python /app/main.py --listen 0.0.0.0

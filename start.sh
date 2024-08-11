#!/bin/bash
cloudflared tunnel --no-autoupdate run --url http://localhost:8188 &
python main.py --listen 0.0.0.0

cloudflared tunnel --no-autoupdate --url http://localhost:8188 > /tmp/cloudflared.log 2>&1 &
echo "Cloudflared started with PID $!" >> /tmp/startup.log

# Wait for the URL to appear in the log file
while ! grep -q "https://" /tmp/cloudflared.log; do
  sleep 1
done

# Extract and display the URL
TUNNEL_URL=$(grep "https://" /tmp/cloudflared.log | sed -n 's/.*https:\/\/\(.*\)"/\1/p')
echo "======== CLOUDFLARED TUNNEL URL ========"
echo "https://$TUNNEL_URL"
echo "========================================"

# Start ComfyUI with suppressed output
python /app/main.py --listen 0.0.0.0 > /dev/null 2>&1 &

# Keep the script running
tail -f /dev/null

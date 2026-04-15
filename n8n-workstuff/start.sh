#!/bin/bash

# Start the tunnel container detached, and capture its logs
echo "Starting Cloudflare Tunnel..."
docker compose up -d tunnel

# Wait for the tunnel to generate the URL (max 30 seconds)
echo "Waiting for tunnel URL..."
URL=""
for i in {1..30}; do
    # Extract the URL from the logs
    URL=$(docker compose logs tunnel 2>&1 | grep -o 'https://[^ ]*trycloudflare\.com' | head -1)
    if [ -n "$URL" ]; then
        break
    fi
    sleep 1
done

if [ -z "$URL" ]; then
    echo "ERROR: Could not detect tunnel URL."
    exit 1
fi

echo "Tunnel URL: $URL"

# Export it so docker compose can use it
export WEBHOOK_URL="$URL"

# Now start the rest of the stack
echo "Starting all services..."
docker compose up -d

echo "Done! n8n webhook URL set to $WEBHOOK_URL"

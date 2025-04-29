#!/bin/sh

if [ ! -e "config/config.yaml" ]; then
    echo "Resource not found, copying from defaults: config.yaml"
    cp -r "default/config.yaml" "config/config.yaml"
fi

# Execute postinstall to auto-populate config.yaml with missing values
npm run postinstall

echo "Ensuring data directory exists..."
mkdir -p /home/node/app/data
echo "Data directory ensured."

# Start the server
exec node server.js --listen "$@"

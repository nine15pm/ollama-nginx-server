#!/bin/bash
nginx -g "daemon off;" &
ollama serve &
sleep 10
if ! ollama list | grep -q "avr/sfr-embedding-mistral:q8_0"; then
  echo "Model not found, pulling..."
  ollama pull avr/sfr-embedding-mistral:q8_0
else
  echo "Model already exists, skipping pull"
fi
wait
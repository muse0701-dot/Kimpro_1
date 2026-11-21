#!/usr/bin/env bash
# Start the free OmniRoute gateway on loopback and register keyless free providers.
# Usage: bash tools/omniroute-free.sh   → OpenAI-compatible API at http://127.0.0.1:20128/v1
# Free models: blockrun/poolside/laguna-xs-2.1, blockrun/nvidia/nemotron-3.5-bolt,
#              blockrun/nvidia/muse-glimmer-30b (keyless; 30 req/min, 300 req/hour per IP)
set -u
B=http://127.0.0.1:20128
command -v omniroute >/dev/null || npm install -g omniroute@3.8.53 --ignore-scripts --no-audit --no-fund
if ! curl -s --max-time 2 -o /dev/null "$B/v1/models"; then
  OMNIROUTE_SERVER_HOST=127.0.0.1 omniroute serve --headless --daemon --no-open --port 20128 >/dev/null 2>&1
  for _ in $(seq 1 40); do curl -s --max-time 2 -o /dev/null "$B/v1/models" && break; sleep 2; done
fi
if ! curl -s "$B/api/provider-nodes" | grep -q openai-compatible-chat-blockrun; then
  curl -s -X POST "$B/api/provider-nodes" -H 'content-type: application/json' \
    -d '{"name":"BlockRun Free","prefix":"blockrun","apiType":"chat","baseUrl":"https://blockrun.ai/api/v1","type":"openai-compatible","providerIdSuffix":"blockrun"}' >/dev/null
  curl -s -X POST "$B/api/providers" -H 'content-type: application/json' \
    -d '{"provider":"openai-compatible-chat-blockrun","name":"BlockRun keyless","url":"https://blockrun.ai/api/v1","apiKey":"none","isActive":true}' >/dev/null
fi
echo "OmniRoute ready at $B/v1 (free: blockrun/*)"

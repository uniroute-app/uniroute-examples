#!/usr/bin/env bash
set -euo pipefail

# Store your UniRoute API key in ~/.config/uniroute/api-key (chmod 600)
KEY_FILE="${UNIROUTE_KEY_FILE:-$HOME/.config/uniroute/api-key}"
BASE="https://api.uniroute.app"
MODEL="${1:-z-image}"
OPTION="${2:-16:9}"
PROMPT="${3:-A quiet lake at sunrise, watercolor illustration.}"

AUTH_HEADER="$(mktemp)"
printf 'Authorization: Bearer %s\n' "$(cat "$KEY_FILE")" > "$AUTH_HEADER"
trap 'rm -f "$AUTH_HEADER"' EXIT

# 1. Request exact quote
curl -sS --fail-with-body -H @"$AUTH_HEADER" \
  -H 'Content-Type: application/json' \
  -d "{\"model\":\"$MODEL\",\"option\":\"$OPTION\"}" \
  "$BASE/v1/media/quote" -o quote.json

QUOTED_USD="$(jq -r '.data.quoted_usd' quote.json)"
echo "Quoted USD for $MODEL ($OPTION): $QUOTED_USD"

# 2. Submit idempotent async task
IDEMP_KEY="$(python3 -c 'import uuid; print(uuid.uuid4())')"
jq -n --arg m "$MODEL" --arg o "$OPTION" --arg p "$PROMPT" --arg c "$QUOTED_USD" \
  '{media_type:"image", model:$m, option:$o, prompt:$p, max_cost_usd:$c}' > request.json

curl -sS --fail-with-body -H @"$AUTH_HEADER" \
  -H 'Content-Type: application/json' \
  -H "Idempotency-Key: $IDEMP_KEY" \
  --data-binary @request.json "$BASE/v1/media/tasks" | jq '.data'

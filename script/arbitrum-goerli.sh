#!/bin/bash

# Check for the -r or --resume flag
RESUME_FLAG=false
for arg in "$@"
do
  if [[ $arg == "-r" ]] || [[ $arg == "--resume" ]]; then
    RESUME_FLAG=true
    break
  fi
done

DEPLOY="forge script script/Deploy.s.sol --chain-id 421613 --rpc-url $RPC_URL --broadcast --code-size-limit 500000 --private-key $PRIVATE_KEY"

# Add the --resume flag if it was specified
if $RESUME_FLAG; then
  DEPLOY+=" --resume"
fi


forge build && export CHAIN_ID=37714555429 && $DEPLOY

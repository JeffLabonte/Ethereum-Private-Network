#!/bin/bash

cd /network
geth --datadir=/network/chaindata init genesis.json

exec "$@"

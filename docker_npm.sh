#!/bin/bash
docker exec -t -w "/code/app" node-app npm install
docker exec -t -w "/code/app" node-app npm run dev -- --host
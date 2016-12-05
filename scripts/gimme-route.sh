#!/bin/bash
curl -s http://router:router@10.244.0.22:8080/routes | jq .api.bosh-lite.com

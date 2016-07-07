# env variables related to CF dev

export DIEGO_RELEASE_DIR=~/workspace/diego-release

export BBS_ENDPOINT=https://10.244.16.2:8889
export BBS_CERT_FILE=$DIEGO_RELEASE_DIR/manifest-generation/bosh-lite-stubs/bbs-certs/client.crt
export BBS_KEY_FILE=$DIEGO_RELEASE_DIR/manifest-generation/bosh-lite-stubs/bbs-certs/client.key


# cf login to local bosh lite
function cf_bosh_lite {
  if (( $# == 0 ))
    then echo usage: cf_bosh_lite password;
  else
    cf api api.bosh-lite.com --skip-ssl-validation && cf auth admin $1 && cf t -o o -s s
  fi
}

# create o and s
function cf_create_org {
  cf create-org o && cf t -o o && cf create-space s && cf t -o o -s s
}

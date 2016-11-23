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

# lazy hack for bosh ssh to c2c envs
function bosh_ssh_c2c {
  if (( $# != 1 ))
    then echo "Usage: bosh_ssh_c2c <env>"
  else
    bosh target bosh.$1.c2c.cf-app.com
    bosh download manifest $1-diego /tmp/$1-diego.yml
    bosh -d /tmp/$1-diego.yml ssh --gateway_host bosh.$1.c2c.cf-app.com --gateway_user vcap --gateway_identity_file ~/workspace/container-networking-deployments/environments/$1/keypair/id_rsa_bosh
  fi
}

gobosh_target ()
{
  env=$1
  export BOSH_DIR=~/workspace/container-networking-deployments/environments/$env

  pushd $BOSH_DIR 1>/dev/null
    export BOSH_USER=$(bbl director-username)
    export BOSH_PASSWORD=$(bbl director-password)
    export BOSH_ENVIRONMENT=$(bbl director-address)
    # TODO: remove me after bbl'ing up with bbl 1.2+
    export BOSH_GW_HOST=$(bbl director-address | cut -d '/' -f 3 | cut -d ':' -f1)
    export BOSH_KEY=/tmp/$env-ssh-key
    bbl ssh-key > $BOSH_KEY
    chmod 600 $BOSH_KEY
    export BOSH_CA_CERT=/tmp/$env-ca-cert
    bbl director-ca-cert > $BOSH_CA_CERT
    chmod 600 $BOSH_CA_CERT
  popd 1>/dev/null

  export BOSH_DEPLOYMENT=cf;
}

gobosh_ssh ()
{
  if (( $# != 1 ))
    then echo "Usage: gobosh_ssh <vm-name>"
  else
    bosh-cli ssh $1 --gw-private-key=$BOSH_KEY
  fi
}

gobosh_build_manifest ()
{
  bosh-cli -d cf build-manifest -l=$BOSH_DIR/deployment-env-vars.yml --var-errs ~/workspace/cf-deployment/cf-deployment.yml
}

gobosh_patch_manifest ()
{
  pushd ~/workspace/cf-deployment 1>/dev/null
    git apply ../container-networking-ci/netman-cf-deployment.patch
  popd 1>/dev/null
}

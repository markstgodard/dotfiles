# general time savers
alias v="vim"
alias vi="vim"
alias cls="clear"
alias h="history"

alias ginko="ginkgo"
alias gingo="ginkgo"
alias gink="ginkgo"

# Cloud Foundry
alias dammit='cd ~/workspace/cf-release && bosh create release --force && bosh target lite && ./scripts/generate-bosh-lite-dev-manifest && bosh -n upload release && bosh -n deploy'
alias dammit-diego='cd ~/workspace/diego-release && bosh create release --force && bosh target lite && ./scripts/generate-bosh-lite-manifests && bosh -n upload release && bosh -d ~/workspace/diego-release/bosh-lite/deployments/diego.yml -n deploy'
alias dammit-routing='cd ~/workspace/cf-release/src/cf-routing-release && bosh create release --force && bosh target lite && ./scripts/generate-bosh-lite-manifest && bosh -n upload release && bosh -d ~/workspace/cf-release/src/cf-routing-release/bosh-lite/deployments/cf-routing-manifest.yml -n deploy'

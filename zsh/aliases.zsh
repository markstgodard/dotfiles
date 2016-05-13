# general time savers
alias vi="vim"
alias cls="clear"
alias h="history"

alias ginko="ginkgo"
alias gingo="ginkgo"
alias gink="ginkgo"

# Cloud Foundry
alias dammit='cd ~/workspace/cf-release && bosh create release --force && bosh target lite && ./scripts/generate-bosh-lite-dev-manifest && bosh -n upload release && bosh -n deploy'
alias dammit-diego='cd ~/workspace/diego-release && bosh create release --force && bosh target lite && ./scripts/generate-bosh-lite-manifests && bosh -n upload release && bosh -d ~/workspace/diego-release/bosh-lite/deployments/diego.yml -n deploy'

alias igiveup='cd ~/workspace/bosh-lite && vagrant halt && vagrant destroy && vagrant up && dammit'


# dot files
alias dots='cd ~/dotfiles && ./scripts/update-dotfiles'

#alias rake="noglob rake"

#!/bin/sh
SESSION_NAME='dev'
WORKDIR=$HOME'/workspace/netman-release'

# create a new tmux session called 'dev'
tmux new-session -n 'dev' -c $WORKDIR -d -s $SESSION_NAME

# 1st window: dev (vim + split for ginkgo tests)
tmux send-keys -t $SESSION_NAME 'vim .' C-m
tmux split-window -h -p 30 -c $WORKDIR
tmux send-keys -t $SESSION_NAME './scripts/docker-test src/lib' C-m

# 2nd window: run adoc tests or 'cf' stuff
tmux new-window -n "test" -c $WORKDIR
tmux send-keys -t $SESSION_NAME:2 '# run adhoc tests, manual CF tests, etc. here' C-m

# 3rd window: run all things BOSH
tmux new-window -n "bosh" -c $WORKDIR
tmux send-keys -t $SESSION_NAME:3 '# do BOSH stuff here' C-m

# 4th window: use for tailing misc logs, etc.
tmux new-window -n "logs" -c $WORKDIR
tmux send-keys -t $SESSION_NAME:4 '# use for tailing logs, etc' C-m
tmux split-window -v -c $WORKDIR

tmux select-window -t $SESSION_NAME:1
tmux -2 attach-session -d

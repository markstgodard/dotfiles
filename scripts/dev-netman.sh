#!/bin/sh
SESSION_NAME='dev'
WORKDIR=$HOME'/workspace/netman-release'
tmux new-session -n 'dev' -c $WORKDIR -d -s $SESSION_NAME
tmux send-keys -t $SESSION_NAME 'vim .' C-m
tmux split-window -h -p 30 -c $WORKDIR
tmux send-keys -t $SESSION_NAME '# run ./scripts/docker-test or ginkgo here' C-m

tmux new-window -n "test" -c $WORKDIR
tmux send-keys -t $SESSION_NAME:2 '# run adhoc tests here' C-m

tmux new-window -n "bosh" -c $WORKDIR
tmux send-keys -t $SESSION_NAME:3 '# do bosh stuff here' C-m

tmux new-window -n "logs" -c $WORKDIR
tmux send-keys -t $SESSION_NAME:4 '# use for tailing logs, etc' C-m
tmux split-window -v -c $WORKDIR

tmux select-window -t $SESSION_NAME:1
tmux -2 attach-session -d

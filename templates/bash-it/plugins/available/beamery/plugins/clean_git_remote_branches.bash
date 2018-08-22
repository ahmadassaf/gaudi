#!/usr/bin/env bash

# Load the main plugins "interface"
source "${HOME}/.bash_it/plugins/available/beamery/pluginsInterface.bash"

# Clean remote branches that have been merged into master and delete them from remotes as well

clean_git_remote_branches() {
    execute -g "git branch -r --merged | egrep -v '(^\*|master|development)' | sed 's/origin\///g'| xargs -n 1 git push --delete origin"
}

#!/usr/bin/env bash

# Load the main plugins "interface"
source "${HOME}/.bash_it/plugins/available/beamery/pluginsInterface.bash"

# Generate NPM report using the npm-check module to inspect the state of our npm modules
# The function will check if npm-check is installed and install it otherwise
# The report will be generated in the root directory and will be called npm-report.txt

generate_npm_report() {
    if command_exists npm-check ; then
        execute -n "npm-check >> ../npm-report.txt"
    else
        printf 'npm-check module was not found. Installing now:';
        npm install -g npm-check
        execute -n "npm-check >> ../npm-report.txt"
    fi
}
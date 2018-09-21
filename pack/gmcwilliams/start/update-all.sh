#!/usr/bin/env bash
#
# update all git submodules (pathogen plugins)

git submodule foreach git pull origin master


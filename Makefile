# Init environment ----------------------------------------

root_dir := $(shell pwd)
name := $(shell basename $(root_dir))
version := $(shell cat $(root_dir)/VERSION)

# Git options ---------------------------------------------

git_user_name := Equoda
repository_name := $(name).git
upstream_label := github
upstream_url := git@github.com:$(git_user_name)/$(repository_name)
branch_name := $(shell git rev-parse --abbrev-ref HEAD)

# Main targets --------------------------------------------

all: help

help:
	$(info --------------------------------------)
	$(info Rum as: "make [target]")
	$(info Available targets:)
	@grep -E "^[0-9a-z-]+[:]$$" $(root_dir)/Makefile | grep -v -E "^git" | sed -e 's/://g' -e 's/^/\t/g'

# Git targets ---------------------------------------------

help-git:
	$(info --------------------------------------)
	$(info Rum as: "make [target]")
	$(info Available targets:)
	@grep -E -o "^git[0-9a-z-]+[:][[:space:]]*" $(root_dir)/Makefile | sed -e 's/://g' -e 's/^/\t/g'

git-init:
	@if [ ! -d $(root_dir)/.git ]; then git init; else echo "Already exists!"; fi

git-info: .git-status .git-branches .git-remotes .git-log

.git-status:
	@printf -- '-_%s_%30s\n' "status" " " | tr ' ' '-' | tr '_' ' '
	@git status

.git-branches:
	@printf -- '-_%s_%30s\n' "branches" " " | tr ' ' '-' | tr '_' ' '
	@git branch --all

.git-remotes:
	@printf -- '-_%s_%30s\n' "remotes" " " | tr ' ' '-' | tr '_' ' '
	@git remote -vv

.git-log:
	@printf -- '-_%s_%30s\n' "log" " " | tr ' ' '-' | tr '_' ' '
	@git log --pretty=format:"%h - %an, %ar : %s"

git-save: .git-add .git-commit

.git-add:
	@git add .

.git-commit:
	@git commit -a

git-set-upstream:
	@git remote remove $(upstream_label)
	@git remote add $(upstream_label) $(upstream_url)

git-upload: git-save .git-push

.git-push:
	@git push $(upstream_label) $(branch_name)

git-upload-new: git-save .git-push-new

.git-push-new:
	@git push -u $(upstream_label) $(branch_name)

git-download:
	@git fetch

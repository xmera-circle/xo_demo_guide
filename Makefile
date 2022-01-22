.PHONY: help 

# Set default variables
#
#ifndef TAG
#override TAG = 3.4.1
#endif

# Assign a referenced variable
#
#REDMINE=redmine_${REDMINE_VERSION}

# Assign an output of a shell command
#
#REDMINE_MOUNT=-v $(shell pwd)/${REDMINE}:${HOME}/redmine
#USER_NAME=$(shell whoami)
#GROUP_NAME=$(shell id -g -n)

#CASE_NAME=$(shell ruby staging_case ${CASE} ${REDMINE})
#XMERA_ROOT=${SOLUTION}_${TAG}
#PWD=$(shell pwd)
#TIMESTAMP=$(shell date +"%Y-%m-%d_%H-%M-%S")
LOCAL=$(shell npm bin)

default: help

help: #: Show help topics
	@grep "#:" Makefile* | grep -v "@grep" | sort | sed "s/\([A-Za-z_ -]*\):.*#\(.*\)/$$(tput setaf 3)\1$$(tput sgr0)\2/g"

html: #: Generate antora html output
ifdef LOCAL
	@${LOCAL}/antora antora-playbook-local.yml;
else
	antora antora-playbook-local.yml;
endif

html_browser: #: Generate antora html output AND open index.html in browser
ifdef LOCAL
	@${LOCAL}/antora antora-playbook-local.yml; \
	firefox build/site/index.html;
else
	antora antora-playbook-local.yml; \
	firefox build/site/index.html;
endif

pdf: #: Generate asciidoctor pdf document
	@cd ./pdf; \
	asciidoctor-pdf xo-doc.adoc; \
	cd ..; \
	xreader pdf/xo-doc.pdf;



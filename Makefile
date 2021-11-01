export CASK ?= $(shell which cask)
export EMACS ?= $(shell which emacs)
EMACS_BATCH = ${CASK} exec ${EMACS} -Q --batch -l package
CASK_DIR := $(shell cask package-directory)

$(CASK_DIR): Cask
	cask install
	@touch $(CASK_DIR)

.PHONY: cask
cask: $(CASK_DIR)

.PHONY: clean
clean :
	${CASK} clean-elc
	rm -rf dist

.PHONY: build
build: 
	cask install

.PHONY: test
test: 
	cask exec ert-runner --verbose


.PHONY: install
install : $(TAR)
	$(EMACS_BATCH) \
		--eval "(add-to-list 'package-archives '(\"MELPA Stable\" . \"https://stable.melpa.org/packages/\"))" \
		-f package-initialize \
		--eval "(unless package-archive-contents (package-refresh-contents))" \
		--eval "(package-install-file \"$(TAR)\")"

.PHONY: help
help :
	@echo 'Makefile for emacs-plugin-template'
	@echo
	@echo 'Main tasks:'
	@echo
	@echo '  build (default) Compile Lisp files.'
	@echo '  help            Show this usage information.'
	@echo '  install         Install idee using the Emacs package manager.'
	@echo '  test            Run automated test suites.'
	@echo '  clean           Delete generated output files.'

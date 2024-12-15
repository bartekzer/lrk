PREFIX ?= /usr/local

SCRIPTS = lrk

all: lrk-install

lrk-install: $(SCRIPTS)
    mkdir -p $(PREFIX)/bin/commands
    install -m 755 -t $(PREFIX)/bin $^
    install -m 644 commands/*.sh $(PREFIX)/commands

.PHONY: all lrk-install
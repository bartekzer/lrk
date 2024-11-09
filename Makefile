PREFIX ?= /usr/local/bin

SCRIPTS = lrk

all: lrk-install

lrk-install: $(SCRIPTS)
    install -m 755 -t $(PREFIX) $^
    mkdir -p $(PREFIX)/commands
    install -m 644 commands/*.sh $(PREFIX)/commands

.PHONY: all
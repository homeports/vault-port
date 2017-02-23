CACHED :=

build: cache
	chmod 0755 .cache/bin/* rc/vault
	docker build -t homeports-dev/vault .
clean:
	rm -fr .cache

CACHED += .cache/bin/vault
.cache/bin/vault:
	mkdir -p $$(dirname $@)
	curl -Lo $@ http://ci-niftylogic-com.s3.amazonaws.com/vault-0.6.5-linux_amd64

CACHED += .cache/bin/init
.cache/bin/init:
	mkdir -p $$(dirname $@)
	curl -Lo $@ http://ci-niftylogic-com.s3.amazonaws.com/init-linux_amd64

CACHED += .cache/bin/rlog
.cache/bin/rlog:
	mkdir -p $$(dirname $@)
	curl -Lo $@ http://ci-niftylogic-com.s3.amazonaws.com/rlog-linux_amd64

cache: $(CACHED)

.PHONY: build cache clean

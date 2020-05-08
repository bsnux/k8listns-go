GONAME=listns
GOARCH=amd64

LINUXBIN=/usr/local/bin
DARWINBIN=/usr/local/bin

macos:
	@echo "Building binary for macOS..."
	GOOS=darwin GOARCH=amd64 go build -o bin/$(GONAME) main.go

linux:
	@echo "Building binary for linux..."
	GOOS=linux GOARCH=amd64 go build -o bin/$(GONAME)-linux main.go

alpine:
	@echo "Building binary for Alpine (musl)..."
	GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -o bin/$(GONAME)-alpine main.go

clean:
	@echo "Cleaning..."
	rm -rf bin/

install-linux:
	@echo "Copying binary to $(LINUXBIN) ..."
	cp bin/$(GONAME)-linux $(LINUXBIN)/$(GONAME)

install-macos:
	@echo "Copying binary to $(DARWINBIN) ..."
	cp bin/$(GONAME) $(DARWINBIN)/$(GONAME)

all: linux macos

.PHONY: linux macos clean all

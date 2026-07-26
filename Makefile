BINARY_NAME=lpechk
BUILD_DIR=dist
INSTALL_DIR=$(HOME)/.local/bin

all: clean build_all

build_all:
	@mkdir -p $(BUILD_DIR)
	# Linux
	GOOS=linux GOARCH=amd64 go build -o $(BUILD_DIR)/$(BINARY_NAME)-linux-amd64 .
	# FreeBSD
	GOOS=freebsd GOARCH=amd64 go build -o $(BUILD_DIR)/$(BINARY_NAME)-freebsd-amd64 .
	# Linux ARM
	GOOS=linux GOARCH=arm64 go build -o $(BUILD_DIR)/$(BINARY_NAME)-linux-arm64 .
	@echo "Builds completed in $(BUILD_DIR)/"

install:
	@mkdir -p $(INSTALL_DIR)
	go build -o $(INSTALL_DIR)/$(BINARY_NAME) .
	@echo "Installed $(BINARY_NAME) to $(INSTALL_DIR)/"

clean:
	echo "Cleaning dist..."
	@rm -rf $(BUILD_DIR)

.PHONY: all build_all install clean

build-all:
	@echo "Building all"
	@go build -o bin/cat ./cat

build-all-arch: build-cat-linux-amd64 build-cat-linux-arm64

build-cat:
	@echo "Building cat"
	@go build -o bin/cat ./cat

build-cat-linux-amd64:
	@echo "Building cat-amd64"
	GOARCH=amd64 GOOS=linux go build -o bin/cat-linux-amd64 ./cat

build-cat-linux-arm64:
	@echo "Building cat-arm64"
	GOARCH=arm64 GOOS=linux go build -o bin/cat-linux-arm64 ./cat

build-cat-linux-386:
	@echo "Building cat-386"
	GOARCH=386 GOOS=linux go build -o bin/cat-linux-386 ./cat

build-cat-windows-amd64:
	@echo "Building cat-windows-amd64"
	GOARCH=amd64 GOOS=windows go build -o bin/cat-windows-amd64.exe ./cat

build-cat-windows-arm64:
	@echo "Building cat-windows-arm64"
	GOARCH=arm64 GOOS=windows go build -o bin/cat-windows-arm64.exe ./cat

build-cat-windows-386:
	@echo "Building cat-windows-386"
	GOARCH=386 GOOS=windows go build -o bin/cat-windows-386.exe ./cat
.PHONY: all all-arch cat rm

all:
	@echo "Building all"
	@go build -o bin/cat ./cat
	@go build -o bin/rm ./rm

ARCHS = linux-amd64 linux-arm64 linux-386 windows-amd64 windows-arm64 windows-386
all-arch: $(addprefix cat-,$(ARCHS)) $(addprefix rm-,$(ARCHS))

cat:
	@echo "Building cat"
	@go build -o bin/cat ./cat

cat-linux-amd64:
	@echo "Building cat-amd64"
	GOARCH=amd64 GOOS=linux go build -o bin/cat-linux-amd64 ./cat

cat-linux-arm64:
	@echo "Building cat-arm64"
	GOARCH=arm64 GOOS=linux go build -o bin/cat-linux-arm64 ./cat

cat-linux-386:
	@echo "Building cat-386"
	GOARCH=386 GOOS=linux go build -o bin/cat-linux-386 ./cat

cat-windows-amd64:
	@echo "Building cat-windows-amd64"
	GOARCH=amd64 GOOS=windows go build -o bin/cat-windows-amd64.exe ./cat

cat-windows-arm64:
	@echo "Building cat-windows-arm64"
	GOARCH=arm64 GOOS=windows go build -o bin/cat-windows-arm64.exe ./cat

cat-windows-386:
	@echo "Building cat-windows-386"
	GOARCH=386 GOOS=windows go build -o bin/cat-windows-386.exe ./cat

rm:
	@echo "Building rm"
	@go build -o bin/rm ./rm

rm-linux-amd64:
	@echo "Building rm-linux-amd64"
	GOARCH=amd64 GOOS=linux go build -o bin/rm-linux-amd64 ./rm

rm-linux-arm64:
	@echo "Building rm-linux-arm64"
	GOARCH=arm64 GOOS=linux go build -o bin/rm-linux-arm64 ./rm

rm-linux-386:
	@echo "Building rm-linux-386"
	GOARCH=386 GOOS=linux go build -o bin/rm-linux-386 ./rm

rm-windows-amd64:
	@echo "Building rm-windows-amd64"
	GOARCH=amd64 GOOS=windows go build -o bin/rm-windows-amd64.exe ./rm

rm-windows-arm64:
	@echo "Building rm-windows-arm64"
	GOARCH=arm64 GOOS=windows go build -o bin/rm-windows-arm64.exe ./rm

rm-windows-386:
	@echo "Building rm-windows-386"
	GOARCH=386 GOOS=windows go build -o bin/rm-windows-386.exe ./rm
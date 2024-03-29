.PHONY: all all-arch cat rm

all:
	@echo "Building all"
	@go build -ldflags="-s -w" -o build/cat ./cat
	@go build -ldflags="-s -w" -o build/rm ./rm

ARCHS = linux-amd64 linux-arm64 linux-386 windows-amd64 windows-arm64 windows-386
all-arch: $(addprefix cat-,$(ARCHS)) $(addprefix rm-,$(ARCHS))

cat:
	@echo "Building cat"
	@go build -ldflags="-s -w" -o build/cat ./cat

cat-linux-amd64:
	@echo "Building cat-amd64"
	GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o build/linux/amd64/cat ./cat

cat-linux-arm64:
	@echo "Building cat-arm64"
	GOARCH=arm64 GOOS=linux go build -ldflags="-s -w" -o build/linux/arm64/cat ./cat

cat-linux-386:
	@echo "Building cat-386"
	GOARCH=386 GOOS=linux go build -ldflags="-s -w" -o build/linux/386/cat ./cat

cat-windows-amd64:
	@echo "Building cat-windows-amd64"
	GOARCH=amd64 GOOS=windows go build -ldflags="-s -w" -o build/windows/amd64/cat.exe ./cat

cat-windows-arm64:
	@echo "Building cat-windows-arm64"
	GOARCH=arm64 GOOS=windows go build -ldflags="-s -w" -o build/windows/arm64/cat.exe ./cat

cat-windows-386:
	@echo "Building cat-windows-386"
	GOARCH=386 GOOS=windows go build -ldflags="-s -w" -o build/windows/386/cat.exe ./cat

rm:
	@echo "Building rm"
	@go build -ldflags="-s -w" -o build/rm ./rm

rm-linux-amd64:
	@echo "Building rm-linux-amd64"
	GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o build/linux/amd64/rm ./rm

rm-linux-arm64:
	@echo "Building rm-linux-arm64"
	GOARCH=arm64 GOOS=linux go build -ldflags="-s -w" -o build/linux/arm64/rm ./rm

rm-linux-386:
	@echo "Building rm-linux-386"
	GOARCH=386 GOOS=linux go build -ldflags="-s -w" -o build/linux/386/rm ./rm

rm-windows-amd64:
	@echo "Building rm-windows-amd64"
	GOARCH=amd64 GOOS=windows go build -ldflags="-s -w" -o build/windows/amd64/rm.exe ./rm

rm-windows-arm64:
	@echo "Building rm-windows-arm64"
	GOARCH=arm64 GOOS=windows go build -ldflags="-s -w" -o build/windows/arm64/rm.exe ./rm

rm-windows-386:
	@echo "Building rm-windows-386"
	GOARCH=386 GOOS=windows go build -ldflags="-s -w" -o build/windows/386/rm.exe ./rm
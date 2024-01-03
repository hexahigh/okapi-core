package main

import (
	"flag"
	"fmt"
	"io"
	"os"
)

var version = "0.0.1"

var pVersion bool
var bufferSize int

func init() {
	flag.IntVar(&bufferSize, "b", 4096, "Buffer size")
	flag.BoolVar(&pVersion, "v", false, "Print version")
	flag.Usage = func() {
		fmt.Fprintf(os.Stderr, "Usage: %s [FLAG]... [FILE]...\n", os.Args[0])
		fmt.Println("If no FILE is given, standard input is used.")
		flag.PrintDefaults()
	}
}

func main() {
	flag.Parse()
	args := flag.Args()
	if pVersion {
		fmt.Println("Okapi-core utils")
		fmt.Println(version)
		os.Exit(0)
	}

	if len(args) == 0 {
		// Read from stdin
		_, err := io.Copy(os.Stdout, os.Stdin)
		if err != nil {
			fmt.Println("Error copying from stdin:", err)
			os.Exit(1)
		}
	} else {
		// Read from file
		file, err := os.Open(args[0])
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
		defer file.Close()
		_, err = io.Copy(os.Stdout, file)
		if err != nil {
			fmt.Println("Error copying from file:", err)
			os.Exit(1)
		}
	}
}

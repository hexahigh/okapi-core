package main

import (
	"flag"
	"fmt"
	"io"
	"os"
)

var version = "1.0.0"

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

	buffer := make([]byte, bufferSize)

	if len(args) == 0 {
		// Read from stdin
		for {
			n, err := os.Stdin.Read(buffer)
			if err != nil && err != io.EOF {
				fmt.Println("Error reading from stdin:", err)
				os.Exit(1)
			}
			if n > 0 {
				_, err = os.Stdout.Write(buffer[:n])
				if err != nil {
					fmt.Println("Error writing to stdout:", err)
					os.Exit(1)
				}
			}
			if err == io.EOF {
				break
			}
		}
	} else {
		// Read from file
		file, err := os.Open(args[0])
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
		defer file.Close()
		for {
			n, err := file.Read(buffer)
			if err != nil && err != io.EOF {
				fmt.Println("Error reading from file:", err)
				os.Exit(1)
			}
			if n > 0 {
				_, err = os.Stdout.Write(buffer[:n])
				if err != nil {
					fmt.Println("Error writing to stdout:", err)
					os.Exit(1)
				}
			}
			if err == io.EOF {
				break
			}
		}
	}
}

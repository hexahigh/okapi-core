package main

import (
	"flag"
	"fmt"
	"os"
	"path/filepath"
)

var version = "1.0.0"

var pVersion bool

func init() {
	flag.BoolVar(&pVersion, "v", false, "Print version")
	flag.Usage = func() {
		fmt.Fprintf(os.Stderr, "Usage: %s [FLAG]... [FILE]...\n", os.Args[0])
		flag.PrintDefaults()
	}
}

func main() {
	recursive := flag.Bool("r", false, "remove directories and their contents recursively")
	force := flag.Bool("f", false, "ignore nonexistent files and arguments, never prompt")
	verbose := flag.Bool("vv", false, "explain what is being done")
	flag.Parse()

	if pVersion {
		fmt.Println("This program is a part of Okapi utils")
		fmt.Println("You are running version", version)
		os.Exit(0)
	}

	for _, arg := range flag.Args() {
		err := remove(arg, *recursive, *force, *verbose)
		if err != nil {
			fmt.Fprintf(os.Stderr, "%v\n", err)
		}
	}
}

func remove(path string, recursive, force, verbose bool) error {
	info, err := os.Stat(path)
	if err != nil {
		if !force || !os.IsNotExist(err) {
			return err
		}
		return nil
	}

	if verbose {
		fmt.Println("removing", path)
	}

	if info.IsDir() && recursive {
		files, err := os.ReadDir(path)
		if err != nil {
			return err
		}

		for _, file := range files {
			err = remove(filepath.Join(path, file.Name()), recursive, force, verbose)
			if err != nil {
				return err
			}
		}
	}

	return os.RemoveAll(path)
}

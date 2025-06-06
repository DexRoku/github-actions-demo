package main

import (
	"fmt"

	_ "golang.org/x/mod/modfile" // dummy import to force go.sum
)

// This is a simple Go application that demonstrates basic arithmetic operations.
func main() {
	fmt.Println("Hello, GitHub Actions!")
	fmt.Println("2 + 3 =", Add(2, 3))
	fmt.Println("5 - 2 =", Subtract(5, 2))
	fmt.Println("4 * 3 =", Multiply(4, 3))
}

// Add two integers and return the result.
func Add(a int, b int) int {
	return a + b
}

// Subtract two integers and return the result.
func Subtract(a int, b int) int {
	return a - b
}

// Multiply two integers and return the result.
func Multiply(a int, b int) int {
	return a * b
}

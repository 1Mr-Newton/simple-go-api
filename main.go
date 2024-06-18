package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, World!")
}

func main() {
	http.HandleFunc("/hello", helloHandler)
	http.HandleFunc("/", helloHandler)
	fmt.Println("Server is running on port 8080")
	if err := http.ListenAndServe("localhost:8080", nil); err != nil {
		fmt.Println("Failed to start server:", err)
	}
}

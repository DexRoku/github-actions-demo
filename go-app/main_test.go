package main

import "testing"

func TestAdd(t *testing.T) {
    if Add(2, 2) != 4 {
        t.Error("Add(2, 2) should be 4")
    }
}

package main

import (
	"reflect"
	"startup/auth"
	"startup/user"
	"testing"

	"github.com/gin-gonic/gin"
)

func Test_authMiddleware(t *testing.T) {
	type args struct {
		authService auth.Service
		userService user.Service
	}
	tests := []struct {
		name string
		args args
		want gin.HandlerFunc
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := authMiddleware(tt.args.authService, tt.args.userService); !reflect.DeepEqual(got, tt.want) {
				t.Errorf("authMiddleware() = %v, want %v", got, tt.want)
			}
		})
	}
}

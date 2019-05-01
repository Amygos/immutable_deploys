package main

import (
	"github.com/Amygos/immutable_deploys/app/configuration"
	"github.com/Amygos/immutable_deploys/app/database"
	"github.com/Amygos/immutable_deploys/app/methods"
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {

	// init configuration
	configuration.Init()

	db := database.Init()
	defer db.Close()

	// init routers
	router := gin.Default()

	router.GET("/health/check", methods.HealthCheck)

	// handle missing endpoint
	router.NoRoute(func(c *gin.Context) {
		c.Status(http.StatusNotFound)
	})

	router.Run()
}

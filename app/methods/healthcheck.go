package methods

import (
	"github.com/Amygos/immutable_deploys/app/database"
	"github.com/gin-gonic/gin"
	"net/http"
)

func HealthCheck(c *gin.Context) {

	db := database.Instance()

	if db := db.Exec("SELECT NOW()"); db.Error != nil {
		c.Status(http.StatusInternalServerError)
	} else {
		c.Status(http.StatusOK)
	}
}

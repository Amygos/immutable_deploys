package database

import (
	"github.com/Amygos/immutable_deploys/app/configuration"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

var db *gorm.DB
var err error

func Instance() *gorm.DB {
	if db == nil {
		Init()
	}
	return db
}

func Init() *gorm.DB {
	conn_params := "user=" + configuration.Config.Database.User + " " +
		"password=" + configuration.Config.Database.Password + " " +
		"host=" + configuration.Config.Database.Host + " " +
		"port=" + configuration.Config.Database.Port + " " +
		"dbname=" + configuration.Config.Database.Name

	db, err = gorm.Open("postgres", "sslmode=require "+conn_params)
	if err != nil {
		panic(err.Error())
	}
	return db
}

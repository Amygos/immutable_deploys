package configuration

import (
	"os"
)

type Configuration struct {
	Database struct {
		Host     string
		Port     string
		User     string
		Name     string
		Password string
	}
}

var Config = Configuration{}

func Init() {
	Config.Database.User = os.Getenv("DB_USER")
	Config.Database.Password = os.Getenv("DB_PASSWORD")
	Config.Database.Host = os.Getenv("DB_HOST")
	Config.Database.Port = os.Getenv("DB_PORT")
	Config.Database.Name = os.Getenv("DB_NAME")
}

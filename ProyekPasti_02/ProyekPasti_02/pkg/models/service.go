package models

import (
	"github.com/jinzhu/gorm"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/config"
)

var db4 *gorm.DB

type Service struct {
	gorm.Model
	// Id            uint   `gorm:"primary_key;auto_increment"json:id`
	NamaLengkap   string `json:"namalengkap"`
	Layanan		  string `json:"layanan"`
	NomorTelepon  string `json:"nomortelepon"`
	TipeMobil	  string `json:"tipemobil"`
	Tanggal       string `json:"tanggal"`
	Waktu         string `json:"waktu"`
	Status        string `json:"status"`
}

func init() {
	config.Connect()
	db4 = config.GetDB()
	db4.AutoMigrate(&Service{})
}
func (b *Service) CreateService() *Service {
	db4.NewRecord(b)
	db4.Create(&b)
	return b
}
func GetAllService() []Service {
	var Service []Service
	db4.Find(&Service)
	return Service
}
func GetServicebyId(id int64) (*Service, *gorm.DB) {
	var GetService Service
	db4 := db.Where("id=?", id).Find(&GetService)
	return &GetService, db4
}
func DeleteService(id int64) Service {
	var service Service
	db4.Where("id=?", id).Delete(service)
	return service
}

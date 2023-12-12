package models

import (
	"github.com/jinzhu/gorm"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/config"
)

var db *gorm.DB

type Saran struct {
	gorm.Model
	// Id           uint   `gorm:"primary_key;auto_increment"json:id`
	Nama         string `json:"nama"`
	NomorTelepon string `json:"nomortelepon"`
	Saran        string `json:"saran"`
}

func init() {
	config.Connect()
	db = config.GetDB()
	db.AutoMigrate(&Saran{})
}
func (b *Saran) CreateSaran() *Saran {
	db.NewRecord(b)
	db.Create(&b)
	return b
}
func GetAllSaran() []Saran {
	var Saran []Saran
	db.Find(&Saran)
	return Saran
}
func GetSaranbyId(id int64) (*Saran, *gorm.DB) {
	var GetSaran Saran
	db := db.Where("id=?", id).Find(&GetSaran)
	return &GetSaran, db
}

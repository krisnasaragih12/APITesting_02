package models

import (
	"github.com/jinzhu/gorm"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/config"
)

var db3 *gorm.DB

type Doorsmeer struct {
	gorm.Model
	// Id            uint   `gorm:"primary_key;auto_increment"json:id`
	NamaLengkap   string `json:"namalengkap"`
	NomorTelepon  string `json:"nomortelepon"`
	TipeKendaraan string `json:"tipekendaraan"`
	Jenis         string `json:"jenis"`
	Tanggal       string `json:"tanggal"`
	Waktu         string `json:"waktu"`
	Status        string `json:"status"`
}

func init() {
	config.Connect()
	db3 = config.GetDB()
	db3.AutoMigrate(&Doorsmeer{})
}
func (b *Doorsmeer) CreateDoorsmeer() *Doorsmeer {
	db3.NewRecord(b)
	db3.Create(&b)
	return b
}
func GetAllDoorsmeer() []Doorsmeer {
	var Doorsmeer []Doorsmeer
	db3.Find(&Doorsmeer)
	return Doorsmeer
}
func GetDoorsmeerbyId(id int64) (*Doorsmeer, *gorm.DB) {
	var GetDoorsmeer Doorsmeer
	db3 := db.Where("id=?", id).Find(&GetDoorsmeer)
	return &GetDoorsmeer, db3
}
func DeleteDoorsmeer(id int64) Doorsmeer {
	var doorsmeer Doorsmeer
	db3.Where("id=?", id).Delete(doorsmeer)
	return doorsmeer
}

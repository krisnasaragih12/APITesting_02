package models

import (
	"github.com/jinzhu/gorm"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/config"
)

var db2 *gorm.DB

type Rental struct {
	gorm.Model
	// Id           uint   `gorm:"primary_key;auto_increment"json:id`
	NamaLengkap         string `json:"namalengkap"`
	Alamat              string `json:"alamat"`
	NomorTelepon        string `json:"nomortelepon"`
	TanggalRental       string `json:"tanggalrental"`
	TanggalPengembalian string `json:"tanggalpengembalian"`
	Type                string `json:"type"`
	Status              string `json:"status"`
}

func init() {
	config.Connect()
	db2 = config.GetDB()
	db2.AutoMigrate(&Rental{})
}
func (b *Rental) CreateRental() *Rental {
	db2.NewRecord(b)
	db2.Create(&b)
	return b
}
func GetAllRental() []Rental {
	var Rental []Rental
	db2.Find(&Rental)
	return Rental
}
func GetRentalbyId(id int64) (*Rental, *gorm.DB) {
	var GetRental Rental
	db2 := db.Where("id=?", id).Find(&GetRental)
	return &GetRental, db2
}
func DeleteRental(id int64) Rental {
	var rental Rental
	db2.Where("id=?", id).Delete(rental)
	return rental
}

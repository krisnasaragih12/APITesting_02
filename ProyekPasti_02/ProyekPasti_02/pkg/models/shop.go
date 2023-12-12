package models

import (
	"github.com/jinzhu/gorm"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/config"
)

var db5 *gorm.DB

type Shop struct {
	gorm.Model
	// Id            uint   `gorm:"primary_key;auto_increment"json:id`
	Nama   string `json:"nama"`
	Gambar string `json:"gambar"`
	Harga  string `json:"harga"`
	Stok   string `json:"stok"`
}

func init() {
	config.Connect()
	db5 = config.GetDB()
	db5.AutoMigrate(&Shop{})
}
func (b *Shop) CreateShop() *Shop {
	db5.NewRecord(b)
	db5.Create(&b)
	return b
}
func GetAllShop() []Shop {
	var Shop []Shop
	db5.Find(&Shop)
	return Shop
}
func GetShopbyId(id int64) (*Shop, *gorm.DB) {
	var GetShop Shop
	db5 := db.Where("id=?", id).Find(&GetShop)
	return &GetShop, db5
}
func DeleteShop(id int64) Shop {
	var shop Shop
	db5.Where("id=?", id).Delete(shop)
	return shop
}
func UpdateShop(id int64) Shop {
	var shop Shop
	db5.Where("id=?", id).Update(shop)
	return shop
}

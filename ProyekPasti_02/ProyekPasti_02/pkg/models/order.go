package models

import (
	"github.com/jinzhu/gorm"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/config"
)

var db6 *gorm.DB

type Order struct {
	gorm.Model
	// Id            uint   `gorm:"primary_key;auto_increment"json:id`
	Nama_Customer   string `json:"nama_customer"`
	Telepon string `json:"telepon"`
	Alamat  string `json:"alamat"`
	Catatan   string `json:"catatan"`
	Payment_Method   string `json:"payment_method"`
	Status   string `json:"status"`
	Gambar   string `json:"gambar"`
}

func init() {
	config.Connect()
	db6 = config.GetDB()
	db6.AutoMigrate(&Order{})
}
func (b *Order) CreateOrder() *Order {
	db6.NewRecord(b)
	db6.Create(&b)
	return b
}
func GetAllOrder() []Order {
	var Order []Order
	db6.Find(&Order)
	return Order
}
func GetOrderbyId(id int64) (*Order, *gorm.DB) {
	var GetOrder Order
	db6 := db.Where("id=?", id).Find(&GetOrder)
	return &GetOrder, db6
}
func DeleteOrder(id int64) Order {
	var order Order
	db6.Where("id=?", id).Delete(order)
	return order
}

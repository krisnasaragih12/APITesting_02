package models

import (
	"github.com/jinzhu/gorm"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/config"
)

var db7 *gorm.DB

type User struct {
	gorm.Model
	// Id            uint   `gorm:"primary_key;auto_increment"json:id`
	Username  string `json:"username`
	Name string `json:"Name"`
	Email  string `json:"email"`
	Password   string `json:"password"`
}

func init() {
	config.Connect()
	db7 = config.GetDB()
	db7.AutoMigrate(&User{})
}
func (b *User) CreateUser() *User {
	db7.NewRecord(b)
	db7.Create(&b)
	return b
}
func GetAllUser() []User {
	var User []User
	db7.Find(&User)
	return User
}
func GetUserbyId(id int64) (*User, *gorm.DB) {
	var GetUser User
	db7 := db.Where("id=?", id).Find(&GetUser)
	return &GetUser, db7
}
func DeleteUser(id int64) User {
	var user User
	db7.Where("id=?", id).Delete(user)
	return user
}

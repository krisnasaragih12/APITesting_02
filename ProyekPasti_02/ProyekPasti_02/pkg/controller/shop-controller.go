package controllers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/models"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/utils"
)

var NewShop models.Shop

func GetShop(w http.ResponseWriter, r *http.Request) {
	NewShop := models.GetAllShop()
	res, _ := json.Marshal(NewShop)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func GetShopById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	shopId := vars["shopId"]
	NIM, err := strconv.ParseInt(shopId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	ShopDetails, _ := models.GetShopbyId(NIM)
	res, _ := json.Marshal(ShopDetails)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func CreateShop(w http.ResponseWriter, r *http.Request) {
	CreateShop := &models.Shop{}
	utils.ParseBody(r, CreateShop)
	b := CreateShop.CreateShop()
	res, _ := json.Marshal(b)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func DeleteShop(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	shopId := vars["shopId"]
	NIM, err := strconv.ParseInt(shopId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	shop := models.DeleteShop(NIM)
	res, _ := json.Marshal(shop)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func UpdateShop(w http.ResponseWriter, r *http.Request) {
	var updateShop = &models.Shop{}
	utils.ParseBody(r, updateShop)
	vars := mux.Vars(r)
	shopId := vars["shopId"]
	NIM, err := strconv.ParseInt(shopId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	shopDetails, db := models.GetShopbyId(NIM)
	if updateShop.Nama != "" {
		shopDetails.Nama = updateShop.Nama
	}
	if updateShop.Gambar != "" {
		shopDetails.Gambar = updateShop.Gambar
	}
	if updateShop.Harga != "" {
		shopDetails.Harga = updateShop.Gambar
	}
	if updateShop.Stok != "" {
		shopDetails.Stok = updateShop.Stok
	}
	db.Save(&shopDetails)
	res, _ := json.Marshal(shopDetails)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}

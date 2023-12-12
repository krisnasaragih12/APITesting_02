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

var NewOrder models.Order

func GetOrder(w http.ResponseWriter, r *http.Request) {
	NewOrder := models.GetAllOrder()
	res, _ := json.Marshal(NewOrder)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func GetOrderById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	orderId := vars["orderId"]
	NIM, err := strconv.ParseInt(orderId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	OrderDetails, _ := models.GetOrderbyId(NIM)
	res, _ := json.Marshal(OrderDetails)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func CreateOrder(w http.ResponseWriter, r *http.Request) {
	CreateOrder := &models.Order{}
	utils.ParseBody(r, CreateOrder)
	b := CreateOrder.CreateOrder()
	res, _ := json.Marshal(b)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func DeleteOrder(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	orderId := vars["orderId"]
	NIM, err := strconv.ParseInt(orderId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	order := models.DeleteOrder(NIM)
	res, _ := json.Marshal(order)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}

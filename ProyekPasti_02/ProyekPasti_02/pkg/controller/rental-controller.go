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

var NewRental models.Rental

func GetRental(w http.ResponseWriter, r *http.Request) {
	NewRental := models.GetAllRental()
	res, _ := json.Marshal(NewRental)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func GetRentalById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	rentalId := vars["rentalId"]
	NIM, err := strconv.ParseInt(rentalId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	RentalDetails, _ := models.GetRentalbyId(NIM)
	res, _ := json.Marshal(RentalDetails)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func CreateRental(w http.ResponseWriter, r *http.Request) {
	CreateRental := &models.Rental{}
	utils.ParseBody(r, CreateRental)
	b := CreateRental.CreateRental()
	res, _ := json.Marshal(b)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func DeleteRental(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	rentalId := vars["rentalId"]
	NIM, err := strconv.ParseInt(rentalId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	rental := models.DeleteRental(NIM)
	res, _ := json.Marshal(rental)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
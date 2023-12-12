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

var NewService models.Service

func GetService(w http.ResponseWriter, r *http.Request) {
	NewService := models.GetAllService()
	res, _ := json.Marshal(NewService)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func GetServiceById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	serviceId := vars["serviceId"]
	NIM, err := strconv.ParseInt(serviceId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	ServiceDetails, _ := models.GetServicebyId(NIM)
	res, _ := json.Marshal(ServiceDetails)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func CreateService(w http.ResponseWriter, r *http.Request) {
	CreateService := &models.Service{}
	utils.ParseBody(r, CreateService)
	b := CreateService.CreateService()
	res, _ := json.Marshal(b)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func DeleteService(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	serviceId := vars["serviceId"]
	NIM, err := strconv.ParseInt(serviceId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	service := models.DeleteService(NIM)
	res, _ := json.Marshal(service)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
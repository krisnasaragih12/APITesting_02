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

var NewDoorsmeer models.Doorsmeer

func GetDoorsmeer(w http.ResponseWriter, r *http.Request) {
	NewDoorsmeer := models.GetAllDoorsmeer()
	res, _ := json.Marshal(NewDoorsmeer)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func GetDoorsmeerById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	doorsmeerId := vars["doorsmeerId"]
	NIM, err := strconv.ParseInt(doorsmeerId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	DoorsmeerDetails, _ := models.GetDoorsmeerbyId(NIM)
	res, _ := json.Marshal(DoorsmeerDetails)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func CreateDoorsmeer(w http.ResponseWriter, r *http.Request) {
	CreateDoorsmeer := &models.Doorsmeer{}
	utils.ParseBody(r, CreateDoorsmeer)
	b := CreateDoorsmeer.CreateDoorsmeer()
	res, _ := json.Marshal(b)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func DeleteDoorsmeer(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	doorsmeerId := vars["doorsmeerId"]
	NIM, err := strconv.ParseInt(doorsmeerId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	rental := models.DeleteDoorsmeer(NIM)
	res, _ := json.Marshal(rental)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
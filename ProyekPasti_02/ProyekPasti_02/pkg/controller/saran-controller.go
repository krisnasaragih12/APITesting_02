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

var NewSaran models.Saran

func GetSaran(w http.ResponseWriter, r *http.Request) {
	NewSaran := models.GetAllSaran()
	res, _ := json.Marshal(NewSaran)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func GetSaranById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	saranId := vars["saranId"]
	NIM, err := strconv.ParseInt(saranId, 0, 0)
	if err != nil {
		fmt.Println("error while parsing")
	}
	saranDetails, _ := models.GetSaranbyId(NIM)
	res, _ := json.Marshal(saranDetails)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}
func CreateSaran(w http.ResponseWriter, r *http.Request) {
	CreateSaran := &models.Saran{}
	utils.ParseBody(r, CreateSaran)
	b := CreateSaran.CreateSaran()
	res, _ := json.Marshal(b)
	w.Header().Set("Content-Type", "pkglication/json")
	w.WriteHeader(http.StatusOK)
	w.Write(res)
}


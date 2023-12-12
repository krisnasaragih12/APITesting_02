package routes

import (
	"github.com/gorilla/mux"
	controllers "github.com/krisnasaragih12/ProyekPasti_02/pkg/controller"
)

var AddDoorsmeer = func(router *mux.Router) {
	router.HandleFunc("/doorsmeer/", controllers.CreateDoorsmeer).Methods("POST")
	router.HandleFunc("/doorsmeer/", controllers.GetDoorsmeer).Methods("GET")
	router.HandleFunc("/doorsmeer/{doorsmeerId}", controllers.GetDoorsmeerById).Methods("GET")
	router.HandleFunc("/doorsmeer/{doorsmeerId}", controllers.DeleteDoorsmeer).Methods("DELETE")

}

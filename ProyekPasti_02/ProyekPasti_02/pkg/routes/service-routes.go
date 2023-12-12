package routes

import (
	"github.com/gorilla/mux"
	controllers "github.com/krisnasaragih12/ProyekPasti_02/pkg/controller"
)

var AddService = func(router *mux.Router) {
	router.HandleFunc("/service/", controllers.CreateService).Methods("POST")
	router.HandleFunc("/service/", controllers.GetService).Methods("GET")
	router.HandleFunc("/service/{serviceId}", controllers.GetServiceById).Methods("GET")
	router.HandleFunc("/service/{serviceId}", controllers.DeleteService).Methods("DELETE")

}

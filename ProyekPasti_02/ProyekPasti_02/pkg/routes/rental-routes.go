package routes

import (
	"github.com/gorilla/mux"
	controllers "github.com/krisnasaragih12/ProyekPasti_02/pkg/controller"
)

var AddRental = func(router *mux.Router) {
	router.HandleFunc("/rental/", controllers.CreateRental).Methods("POST")
	router.HandleFunc("/rental/", controllers.GetRental).Methods("GET")
	router.HandleFunc("/rental/{rentalId}", controllers.GetRentalById).Methods("GET")
	router.HandleFunc("/rental/{rentalId}", controllers.DeleteRental).Methods("DELETE")

}

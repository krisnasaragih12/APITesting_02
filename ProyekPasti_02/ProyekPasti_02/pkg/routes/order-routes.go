package routes

import (
	"github.com/gorilla/mux"
	controllers "github.com/krisnasaragih12/ProyekPasti_02/pkg/controller"
)

var AddOrder = func(router *mux.Router) {
	router.HandleFunc("/order/", controllers.CreateOrder).Methods("POST")
	router.HandleFunc("/order/", controllers.GetOrder).Methods("GET")
	router.HandleFunc("/order/{orderId}", controllers.GetOrderById).Methods("GET")
	router.HandleFunc("/order/{orderId}", controllers.DeleteOrder).Methods("DELETE")

}
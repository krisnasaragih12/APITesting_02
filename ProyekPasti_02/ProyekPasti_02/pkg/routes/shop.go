package routes

import (
	"github.com/gorilla/mux"
	controllers "github.com/krisnasaragih12/ProyekPasti_02/pkg/controller"
)

var AddShop = func(router *mux.Router) {
	router.HandleFunc("/shop/", controllers.CreateShop).Methods("POST")
	router.HandleFunc("/shop/", controllers.GetShop).Methods("GET")
	router.HandleFunc("/shop/{shopId}", controllers.GetShopById).Methods("GET")
	router.HandleFunc("/shop/{shopId}", controllers.UpdateShop).Methods("PUT")
	router.HandleFunc("/shop/{shopId}", controllers.DeleteShop).Methods("DELETE")

}

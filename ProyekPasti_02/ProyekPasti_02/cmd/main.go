package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"github.com/krisnasaragih12/ProyekPasti_02/pkg/routes"
)

func main() {
	r := mux.NewRouter()
	routes.AddSaran(r)
	routes.AddRental(r)
	routes.AddDoorsmeer(r)
	routes.AddService(r)
	routes.AddShop(r)
	routes.AddOrder(r)
	routes.AddUser(r)
	http.Handle("/", r)
	fmt.Print("Starting Server localhost:9010")
	log.Fatal(http.ListenAndServe("localhost:9010", r))
}

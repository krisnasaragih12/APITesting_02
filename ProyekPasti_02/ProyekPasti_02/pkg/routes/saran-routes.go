package routes
import (
"github.com/gorilla/mux"
"github.com/krisnasaragih12/ProyekPasti_02/pkg/controller"
)
var AddSaran = func(router *mux.Router) {
router.HandleFunc("/saran/",controllers.CreateSaran).Methods("POST")
router.HandleFunc("/saran/", controllers.GetSaran).Methods("GET")
router.HandleFunc("/saran/{saranId}",controllers.GetSaranById).Methods("GET")
}
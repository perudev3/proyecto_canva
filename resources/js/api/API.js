import axios from "axios";

/**Ruta de la api que no requiere autenticacion por parte del cliente**/
const Api = axios.create({
    baseURL: 'http://127.0.0.1:8081/',
    headers: {
        'Content-Type': 'application/json'
    }
});

export default Api;
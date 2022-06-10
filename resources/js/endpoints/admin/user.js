import API from "../../api/API";

const END_POINT_GET = '/user_membership?name=';

export default {

    GetUserMembreship(name){
        return API.get(END_POINT_GET+name)
    },

    
}
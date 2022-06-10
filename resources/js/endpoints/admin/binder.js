import API from "../../api/API";

const END_POINT_CREATE = 'create/binders';
const END_POINT_GET = 'get/binders';

export default {

    GetBinders(){
        return API.get(END_POINT_GET)
    },

    CreateBinder(data) {
        return API.post(END_POINT_CREATE, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },

    
}
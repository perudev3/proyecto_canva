import API from "../../api/API";

const END_POINT_CREATE = 'create/files';
const END_POINT_GET = 'get/files';

export default {

    GetFiles(){
        return API.get(END_POINT_GET)
    },

    CreateFile(data) {
        return API.post(END_POINT_CREATE, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },

    
}
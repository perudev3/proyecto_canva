import API from "../../api/API";

const END_POINT_CREATE = 'create/files';
const END_POINT_POST = 'get_files';

export default {

    GetFiles(binder_id){
        return API.post(END_POINT_POST,{ 'binder_id' : binder_id})
    },

    CreateFile(data) {
        return API.post(END_POINT_CREATE, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },

    SearchFiles(data){
        return API.post(END_POINT_SEARCH, data)
    }

    
}
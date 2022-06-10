import API from "../../api/API";

const END_POINT_GET = 'get_binders_empresa';
const END_POINT_GET_FILE = 'get_files_empresa';

export default {

    GetBindersEmpresa(){
        return API.get(END_POINT_GET)
    },

    GetFileEmpresa(binder_id){
        return API.post(END_POINT_GET_FILE, { 'binder_id' : binder_id})
    },
    
}
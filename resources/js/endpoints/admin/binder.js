import API from "../../api/API";

const END_POINT_CREATE = 'create/binders';
const END_POINT_GET = 'get/binders';
const END_POINT_GET_PAGE = 'get/binders?page=';

export default {

    GetBinders() {
        return API.get(END_POINT_GET)
    },

    GetPageBinder(page) {
        return API.get(END_POINT_GET_PAGE + page)
    },

    CreateBinder(data) {
        return API.post(END_POINT_CREATE, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },


}
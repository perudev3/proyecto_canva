import API from "../../api/API";

const END_POINT_CREATE = 'create/category';
const END_POINT_GET = 'get/categories';
const END_POINT_GET_PAGE = 'get/categories?page=';

export default {

    GetCategories() {
        return API.get(END_POINT_GET)
    },

    GetPageCategories(page) {
        return API.get(END_POINT_GET_PAGE + page)
    },

    CreateCategory(data) {
        return API.post(END_POINT_CREATE, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },


}
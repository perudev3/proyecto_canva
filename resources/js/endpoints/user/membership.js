import API from "../../api/API";

const END_POINT_CREATE = 'create/membership';

export default {

    CreateMembership() {
        return API.post(END_POINT_CREATE)
    },

    
}
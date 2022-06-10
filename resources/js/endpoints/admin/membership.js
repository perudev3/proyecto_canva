import API from "../../api/API";

const END_POINT_CREATE = 'create/membership';

export default {

    CreateMembership(data) {
        return API.post(END_POINT_CREATE, data)
    },

    
}
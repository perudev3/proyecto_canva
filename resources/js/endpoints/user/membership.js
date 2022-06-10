import API from "../../api/API";

const END_POINT_GET = 'get/membership';
const END_POINT_CREATE = 'suscription_membership_empresa';

export default {

    GetMembership() {
        return API.get(END_POINT_GET)
    },


    CreateSuscriptionMembership(data) {
        return API.post(END_POINT_CREATE, data)
    },
    
}
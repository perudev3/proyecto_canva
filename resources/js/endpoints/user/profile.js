import API from "../../api/API";

const END_POINT_UPDATE = 'update_user';
const END_POINT_GET = 'data_user';
const END_POINT_UPLOAD_FOTO = 'upload/photo';

export default {

    GetDataUser() {
        return API.get(END_POINT_GET)
    },

    UpdateDataUser(data) {
        return API.post(END_POINT_UPDATE, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },

    UploadFotoUser(data) {
        return API.post(END_POINT_UPLOAD_FOTO, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },

    UpdateDataUser(data) {
        return API.post(END_POINT_UPDATE, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },


}
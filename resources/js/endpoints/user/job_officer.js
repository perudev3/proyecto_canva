import API from "../../api/API";

const END_POINT_CREATE = 'create/job_offer';
const END_POINT_GET = 'get/jobs_officer';
const END_POINT_POST = 'post/first_jobs_officer';

export default {

    CreateJobs(data) {
        return API.post(END_POINT_CREATE, data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            }
        })
    },

    GetJobs() {
        return API.get(END_POINT_GET)
    },

    GetFirstJob(job_offer_id) {
        return API.post(END_POINT_POST, { 'job_offer_id': job_offer_id })
    }

}
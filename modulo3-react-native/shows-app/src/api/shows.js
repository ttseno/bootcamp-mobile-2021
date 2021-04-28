import axios from 'axios'

export default axios.create({
    baseURL: "http://f3de7b7e66fb.ngrok.io",
    headers: {
        "Authorization": "Bearer token"
    }
});
import axios from 'axios'

export default axios.create({
    baseURL: "http://f3de7b7e66fb.ngrok.io",
    headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5vdm9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzZWNyZXRvIiwiaWF0IjoxNjE4NDM4NzEzLCJleHAiOjE2MTg0NTY3MTN9.quJozWCnyCoX0yMkIjv_O_hK2OG2dbojSl5dtMTAi20"
    }
});
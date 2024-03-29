import axios from 'axios'
// import { getToken } from './setToken'
// import { Message } from 'element-ui'
 
console.log(axios,"axios");
const request = axios.create({
    baseURL: '/api',  //baseURL自动加在请求地址上
    timeout: 3000,
})


//添加请求拦截器
// request.interceptors.request.use((config) => {
//     config.headers['token'] = getToken('token')


//     return config


// }, (error) => {
//     return Promise.reject(error)
// })

//添加响应拦截器
// request.interceptors.response.use((response) => {
//     let { status, message } = response.data
//     if (status !== 200) {
//         Message({ message: message || 'error', type: 'warning' })
//     }


//     return response
// }, (error) => {
//     return Promise.reject(error)
// })

 

export default request
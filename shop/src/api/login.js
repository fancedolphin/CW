import request from "@/utils/request";

export function login(data) {
    return request({
        method: 'post',
        url: '/login',
        data
    })
}

export function add(data) {
    return request({
        method: 'post',
        url: 'store/store/add',
        data
    })
}
export function SecondhandLog(parms) {
    return request({
        method: 'get',
        url: `schoolService/secondhand/selectHistory?pageNum=${parms.pageNum}&pageSize=${parms.pageSize}&articleName=${parms.articleName}`,

    })
}
export function DeliveryLog(parms) {
    return request({
        method: 'get',
        url: `schoolService/delivery/selectHistory?pageNum=${parms.pageNum}&pageSize=${parms.pageSize}&articleName=${parms.articleName}`,

    })
}
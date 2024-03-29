import request from "@/utils/request";

export function addDelivery(data) {
    return request({
        method: 'post',
        url: 'schoolService/delivery/insert',
        data
    })
}

export function deliveryDel(parms) {
    return request({
        method: 'get',
        url: `schoolService/delivery/delete?id=${parms.id}`,
        
    })
}
export function deliveryList(parms) {
    return request({
        method: 'get',
        url: `schoolService/delivery/select?pageNum=${parms.pageNum}&pageSize=${parms.pageSize}&articleName=${parms.articleName}`,
        
    })
}
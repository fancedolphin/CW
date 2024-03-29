import request from "@/utils/request";

export function addSecondHand(data) {
    return request({
        method: 'post',
        url: 'schoolService/secondhand/insert',
        data
    })
}   

export function secondhandDel(parms) {
    return request({
        method: 'get',
        url: `schoolService/secondhand/delete?id=${parms.id}`,
        
    })
}
export function secondList(parms) {
    return request({
        method: 'get',
        url: `schoolService/secondhand/select?pageNum=${parms.pageNum}&pageSize=${parms.pageSize}&articleName=${parms.articleName}`,
        
    })
}
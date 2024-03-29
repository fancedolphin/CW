export function validateName(rule, value, callback) {
    let reg = /(^[a-zA-Z0-9]{4,10}$)/
    if (value === '') {
        callback(new Error('请输入账号'))
    } else if (!reg.test(value)) {
        callback(new Error('请输入4-10位账号'))
    } else {
        callback()
    }
}

export function validatePass(rule, value, callback) {
    let pass = /^\S*(?=\S{6,12})(?=\S*\d)(?=\S*[A-Z])(?=\S*[a-z])(?=\S*[!@#$%^&*? ])\S*$/
    if (value === '') {
        callback(new Error('请输入密码'))
    } else if (!pass.test(value)) {
        callback(new Error('请输入6-12位密码,包含大小写字母,数字及特殊符号'))
    } else {
        callback()
    }
}
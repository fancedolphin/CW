<template>
    <div class='login'>
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span>登录页面</span>
            </div>
            <el-form :model="form" :rules="rules" ref="form" label-width="100px" class="demo-ruleForm">
                <el-form-item label="账号" prop="userName">
                    <el-input clearable v-model="form.userName"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="passWord">
                    <el-input type="password" clearable v-model="form.passWord"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button style="width:100%" type="primary" @click="submitForm('form')">登录</el-button>
                </el-form-item>
            </el-form>
        </el-card>
    </div>
</template>
<script>
import { validateName, validatePass } from '../utils/validate'
import { setToken } from '@/utils/setToken'
import { login } from '@/api/login'
export default {
    data() {
        return {
            form: {
                userName: '',
                passWord: '',
            },
            rules: {
                userName: [{ validator: validateName, trigger: 'blur' },],
                passWord: [{ validator: validatePass, trigger: 'blur' }],
            }
        }
    },
    methods: {
        submitForm(form) {
            this.$refs[form].validate((valid) => {
                if (valid) {
                    login(this.form).then((res) => {
                        if (res.data.status == 200) {
                            setToken('username', res.data.username)
                            setToken('token', res.data.token)
                            this.$message({ message: res.data.message, type: 'success' })
                            this.$router.push('/home')
                        }
                    }).catch((err) => {
                        console.log(err);
                    })
                } else {
                    console.log(this.form);
                }
            })
        }
    }
}
</script>
<style  scoped>
.login {
    width: 100%;
    height: 100%;
    position: absolute;
    background: #409eff;
}

.box-card {
    width: 450px;
    margin: 200px auto;
}
</style>
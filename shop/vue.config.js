const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave:false /*关闭语法检查*/

})

module.exports = {
  devServer: {
    open: true,
    proxy: {
      '/api': {
        target: 'http://192.168.0.112:6969/',//目标地址
        changeOrigin: true,                 //允许跨域
        pathRewrite: {
          '^/api': ''
        }
      }
    }
  }
}
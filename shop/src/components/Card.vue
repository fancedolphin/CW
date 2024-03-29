<template>
  <div class="Card v " style="margin: 10px;">

    <div class="title blod fs-large" style="line-height: 60px;">
      {{ data.title }}
    </div>
    <div class="v">
      <div class="sb h c padding-1x">
        <div class="h c">
          <el-avatar :size="60" src="https://empty" @error="errorHandler" style="margin-right:10px ;">
            <img :src="data.img" />
          </el-avatar>
          <div style="color: rgb(103, 178, 236);margin-right:10px">{{ data.studentName }}</div>
          <div v-if="data.studentAge" style="margin-right:10px">{{ data.studentAge  }}</div>
          <div v-if="data.studentSex" style="margin-right:10px">{{ data.studentSex  }}</div>
          <div >{{ data.createTime ? formatDate(data.createTime) : ' 2023/12/20 12.30' }}</div>
        </div>
        <div>
          <el-tag style="width: 100px;">{{ data.articleName ? data.articleName : 'NO DATA' }}</el-tag>
        </div>
      </div>


      <div class="h  sb padding-1x" style="height: 250px;">
        <div class="v">

          <div style="text-align: left;margin-top: 10px;" class="v ">
            <div v-if="data.deliveryTime" class="h c cardText" style="text-align: left;padding: 10px 0;">
              <div class="blod ">
                delivery Time :
              </div>
              <div>
                {{ data.deliveryTime }}
              </div>
            </div>
            <div v-if="data.deliveryTel" class="h c cardText" style="text-align: left;padding: 10px 0;">
              <div class="blod ">
                delivery Tel :
              </div>
              <div>
                {{ data.deliveryTel }}
              </div>
            </div>
            <div v-if="data.deliveryPerson" class="h c cardText" style="text-align: left;padding: 10px 0;">
              <div class="blod ">
                delivery person :
              </div>
              <div>
                {{ data.deliveryPerson }}
              </div>
            </div>
            <div v-if="data.price" class="h c cardText" style="text-align: left;padding: 10px 0;">
              <div class="blod ">
                price :
              </div>
              <div>
                {{ data.price }}
              </div>
            </div>
            <div v-if="data.articleDescribe" class="h c cardText" style="text-align: left;padding: 10px 0;">
              <div class="blod ">
                article describe:
              </div>
              <div>
                {{ data.articleDescribe }}
              </div>
            </div>
            <div v-if="data.studentNumber" class="h c cardText" style="text-align: left;padding: 10px 0;">
              <div class="blod ">
                student numbere:
              </div>
              <div>
                {{ data.studentNumber }}
              </div>
            </div>
            <div v-if="data.studentNumber" class="h c cardText"  style="text-align: left;padding: 10px 0;">
              <div class="blod ">
                student Tel:
              </div>
              <div>
                {{ data.studentTel }}
              </div>
            </div>
          </div>
        </div>
        <!-- <img
          :src="data.picture ? data.picture != '照片路径' ? require(`${data.picture}`) : require('../assets/img/月.png') : require('../assets/img/月.png')"
          height="200" width="230" /> -->
        <img :src="getImagePath()" height="200" width="230" />
      </div>

      <div class="h c sb padding-1x">
        <div class="h c">
          <div class="el-icon-chat-dot-square fs-ax-large"></div>
          <div>
            <el-input v-model="input" placeholder="message board"></el-input>
          </div>
        </div>
        <el-button type="success" style="width: 300px;height: 50px;" @click="toPay()">Confirm purchase</el-button>
      </div>
    </div>

  </div>
</template>

<script>
import { secondhandDel } from '@/api/Secondhand'
import { deliveryDel } from '@/api/RunErrands'

export default {
  name: 'HelloWorld',
  props: {
    data: {
      type: Object,
      default: () => {
        return {
          title: 'title',
          img: 'https://cube.elemecdn.com/e/fd/0fc7d20532fdaf769a25683617711png.png',
          name: 'name',
          time: '2000/00/00 12.30',
          content: 'content',
          tag: 'tag',
        }
      }
    }
  },
  data() {
    return {
      input: null
    }
  },
  methods: {
    errorHandler() {
      return true
    },
    getImagePath(){
      if (this.data.picture && this.data.picture !== '照片路径') {
        return require(`../assets/img/${this.data.picture}`);
        // return require('../assets/img/月.png');

      } else {
        return require('../assets/img/背景.jpg');
      }
    },
    toPay() {
      this.$confirm("Are you sure you want to purchase this product", "sure", {
        dangerouslyUseHTMLString: true,
        type: "warning",
        confirmButtonText: 'Sure',
        cancelButtonText: 'Cancel',
      }).then(() => {
        if(this.data.title=='Errand service'){
          deliveryDel({ id: this.data.id }).then((res) => {
          if (res.data.code == 200) {
            this.$parent.toQuery()
            this.$message({ message: "Purchase successful", type: "success" });
          }
        })
        }else{
          secondhandDel({ id: this.data.id }).then((res) => {
          if (res.data.code == 200) {
            this.$parent.toQuery()
            this.$message({ message: "Purchase successful", type: "success" });
          }
        })
        }
       

      }).catch(() => {
        this.$message({ message: "Purchase failed", type: "success" });

      })
    },
    formatDate(dateString) {
      // 创建 Date 对象
      const date = new Date(dateString);
      
      // 获取年月日时分秒
      const year = date.getFullYear();
      const month = this.padZero(date.getMonth() + 1);
      const day = this.padZero(date.getDate());
      const hours = this.padZero(date.getHours());
      const minutes = this.padZero(date.getMinutes());
      const seconds = this.padZero(date.getSeconds());
      
      // 返回格式化后的日期字符串
      return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    },
    padZero(value) {
      // 在个位数前面补零
      return value < 10 ? `0${value}` : value;
    }
  }
}
</script>

<style scoped lang="less">
.Card {
  width: 40%;
  height: 540px;
  border: 1px solid black;
  background-color: rgb(255, 251, 258) !important;
  border-radius: 10px;

  .title {
    width: 60%;
    height: 60px;
    border-right: 1px solid black;
    border-bottom: 1px solid black;
  }
  .cardText{
    font-size: 1.5rem;
  }
}
</style>

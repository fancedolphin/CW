<template>
  <div>
    <div class="v s" style="width: 100%;height: 93vh">
      <div class="h c" style="width: 300px;height: 50px;margin:10px">
        <el-input v-model="articleName" placeholder="message board" style="width: 200px;"></el-input>
        <el-button @click="toQuery(activeName)" type="primary">query</el-button>
      </div>
      <el-tabs v-model="activeName" @tab-click="toQuery(activeName)">
        <el-tab-pane label="secondhand" name="secondhand"></el-tab-pane>
        <el-tab-pane label="delivery" name="delivery"></el-tab-pane>
      </el-tabs>

      <el-table :data="tableData.list" border
        style="width: 100%;height: 100%;background-color:rgba(255, 255, 255, .5);margin-top: 10px;">
        <el-table-column v-for="item in data" :key="item" :prop="item.name" :label="item.name" :min-width="item.width">
        </el-table-column>

      </el-table>
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="pageNum"
        :page-sizes="[5, 10, 15, 20]" :page-size="pageSize" layout="total, sizes, prev, pager, next, jumper"
        :total="tableData.total">
      </el-pagination>
    </div>

  </div>
</template>

<script>
import { SecondhandLog, DeliveryLog } from '@/api/login'
export default {
  name: 'infon',
  data() {
    return {
      activeName: 'secondhand',
      articleName: '',
      data: [
        {
          name: 'studentName',
          width: 100,
        },
        {
          name: 'studentAge',
          width: 100,
        },
        {
          name: 'studentSex',
          width: 100,
        }, {
          name: 'studentTel',
          width: 100,
        }, {
          name: 'articleName',
          width: 100,
        }, {
          name: 'picture',
          width: 100,
        }, {
          name: 'articleDescribe',
          width: 100,
        }, {
          name: 'price',
          width: 100,
        }, {
          name: 'createTime',
          width: 100,
        },
      ],
      tableData: {
        list:[],
        total:0
      },
      pageNum: 1,
      pageSize: 5
    }
  },
  mounted() {
   this.toQuery(this.activeName)
  },
  methods: {
    handleClick() {

    },
    handleSizeChange(val) {
      this.pageSize = val
      this.getContent()
    },
    handleCurrentChange(val) {
      this.pageNum = val
      this.getContent()
    },
    toQuery(type) {
      if (type == 'secondhand') {
        SecondhandLog({
          articleName: this.articleName,
          pageNum: this.pageNum,
          pageSize: this.pageSize
        }).then(e => {
          console.log(e);
          if (e.data.code == 200) {
            this.tableData = e.data.data
          }
        })
      } else {
        DeliveryLog({
          articleName: this.articleName,
          pageNum: this.pageNum,
          pageSize: this.pageSize
        }).then(e => {
          console.log(e);
          if (e.data.code == 200) {
            this.tableData = e.data.data
          }
        })
      }
    },


  }
}
</script>
<style>
.about {
  width: 100%;
  height: 100%;
}
</style>
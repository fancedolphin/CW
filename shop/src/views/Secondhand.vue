<template>
  <div class=" v c " style="position: relative;margin-top: 11px;">
    <div v-if="ShoopData.list && ShoopData.list.length > 0" class="v c" style="width: 100%;margin-bottom: 120px;">
      <Card v-for="item in ShoopData.list" :data="item" :key="item.id"></Card>
    </div>
    <div v-else style="height: 88vh;line-height: 100px;" class="fs-large">
      No Data
    </div>


    <el-button style="position: absolute;right: 5%;top: 1%;width: 200px;height: 50px;" @click="dialogFormVisible = true"
      type="primary">Add Second Hand</el-button>
    <div class="h c" style="position: absolute;left: 2%;top: 1%;width: 300px;height: 50px;">
      <el-input v-model="articleName" placeholder="message board" style="width: 200px;"></el-input>
      <el-button @click="toQuery()" type="primary">query</el-button>
    </div>

    <div style="position: fixed;bottom: 0;width: 100%;">
      <div style="background-color: white">
        <el-pagination @size-change="handleSizeChange" style="color:black" @current-change="handleCurrentChange"
          :current-page="pageNum" :page-sizes="[3, 6,]" :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper" :total="ShoopData.total">
        </el-pagination>
      </div>

      <div style="background-color: rgb(51, 51, 51);width: 100%;color: aliceblue;" class=" h c sa ">
        <div class="v c">
          <div class=" blod" style="padding: 5px;">about us</div>
        </div>
        <div class="v c">
          <div class=" blod" style="padding: 5px;">development member</div>
          <div class="fs-mini" style="padding: 5px;">Andrea</div>
          <div class="fs-mini" style="padding: 5px;">Sylvia</div>
          <div class="fs-mini" style="padding: 5px;">Steven</div>
         
        </div>
        <div class="v c">
          <div class=" blod" style="padding: 5px;">Personal blog link</div>
          <div class="fs-mini" style="padding: 5px;">xxxxxx</div>
          <div class="fs-mini" style="padding: 5px;">xxxxxx</div>
        </div>
      </div>
    </div>

    <!--表单 -->
    <el-dialog title="" :visible.sync="dialogFormVisible" modal-append-to-body :close-on-click-modal="false">
      <el-form :model="form" ref="form" label-width="150px" :rules="rules">
        <h1 class="fs-large padding-2-0x">Add Shoop</h1>
        <el-form-item label="studentName" prop="studentName">
          <el-input v-model="form.studentName" maxlength="20" show-word-limit autocomplete="off"></el-input>
        </el-form-item>

          <el-form-item label="studentNumber" prop="studentNumber">
          <el-input v-model.number="form.studentNumber" maxlength="20" show-word-limit autocomplete="off"></el-input>
          </el-form-item>
        <div class="h c sb">
          <el-form-item label="studentAge" prop="studentAge">
            <el-input v-model.number="form.studentAge" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="studentSex" prop="studentSex">
            <el-input v-model="form.studentSex" autocomplete="off"></el-input>
          </el-form-item>
        </div>
        <el-form-item label="articleName" prop="articleName">
          <el-input v-model="form.articleName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="picture" prop="picture">
          <div class="h c">
            <el-input v-model="form.picture" autocomplete="off" style="width: 80%;"></el-input>
         ( For example:log.png )
          </div>
          
        </el-form-item>
        <el-form-item label="studentTel" prop="studentTel">
          <el-input v-model.number="form.studentTel" autocomplete="off"></el-input>
        </el-form-item>
      
        <el-form-item label="price" prop="price">
          <el-input-number v-model="form.price" :precision="2" :step="0.1" :max="9999999" :min="0" style="width: 100%;"></el-input-number>
        </el-form-item>
        <el-form-item label="articleDescribe" prop="articleDescribe">
          <el-input v-model="form.articleDescribe" type="textarea" :rows="3" maxlength="30" show-word-limit
            autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="toAddDat()" :loading="loading">Sumbit</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { addSecondHand, secondList } from '@/api/Secondhand'
import Card from '../components/Card.vue'


export default {
  name: 'Secondhand',
  components: {
    Card
  },
  data() {
    return {
      data: null,
      articleName: '',
      ShoopData: {
        list: [],
        total:0
      },
      // ShoopData: [
      //   {
      //     title: 'Second-hand transactions',
      //     img: require('../assets/img/银行.png'),
      //     name: 'Alice',
      //     time: '2000/00/00 12.30',
      //     content: 'content',
      //     tag: 'TABCG',
      //   },
      //   {
      //     title: 'Second-hand transactions',
      //     img: require('../assets/img/银行.png'),
      //     name: 'Alice',
      //     time: '2000/00/00 12.30',
      //     content: 'content',
      //     tag: 'TABCG',
      //   },
      //   {
      //     title: 'Second-hand transactions',
      //     img: require('../assets/img/银行.png'),
      //     name: 'Alice',
      //     time: '2000/00/00 12.30',
      //     content: 'content',
      //     tag: 'TABCG',
      //   },
      // ],
      rules: {
        studentName: [{ required: true, message: 'Please enter your studentName', trigger: 'blur' },
        { min: 0, max: 20, message: 'Length 3 to 20 characters', trigger: 'blur' }],
        studentNumber: [{ required: true, message: 'Please enter your studentNumber', trigger: 'change' },
        ],
      }
      ,
      dialogFormVisible: false,
      loading: false,
      form: {
        studentNumber: '',
        studentName: '',
        studentAge: '',
        studentTel: '',
        studentSex: '',
        articleName: '',
        picture: '',
        articleDescribe: '',
        deliveryTel: '',
        deliveryPerson: '',
        price:0
      },
      pageNum: 1,
      pageSize: 3
    }
  },
  mounted() {
    this.toQuery()
  },
  methods: {
    handleSizeChange(val) {
      this.pageSize = val
      this.toQuery()
    },
    handleCurrentChange(val) {
      this.pageNum = val
      this.toQuery()
    },
    toAddDialog(type) {
      this.dialogFormVisible = true,
        this.form.type = type
    },
    toAddDat() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          this.loading = true
          addSecondHand(this.form).then(res => {
            if (res.data.code == 200) {
              this.loading = false
              this.dialogFormVisible = false,
              this.$refs.form.resetFields()
              this.$message.success('finish adding')
              this.toQuery()
            } else {
              this.loading = false
              this.$message.error('addition failed')
            }

          })
        }

      })

    },
    toQuery() {
      secondList({
        articleName: this.articleName,
        pageNum: this.pageNum,
        pageSize: this.pageSize
      }).then((res) => {
        if (res.data.code == 200) {
          this.ShoopData = res.data.data
          this.ShoopData.list.forEach(item=>{
            item.title='Second-hand transactions'
          })
          console.log(this.ShoopData.list,"this.ShoopData.list");
        }
      })
    }
  }
}
</script>
<style lang="less">
// .el-dialog {
//   background-color: rgba(30, 30, 42, 0.8);
// }

// .el-form-item__label {
//   color: white !important;
// }

// .el-input__inner {
//   background-color: rgba(144, 145, 150, 0.8);
//   color: white !important;

// }</style>

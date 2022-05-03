<template>
    <el-card class="box-card" :style="boxCardStyle">
        <el-table
            :data="tableTree"
            style="width: 100%;margin-bottom: 20px;"
            row-key="id"
            height = "530"
            default-expand-all
            :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
            <el-table-column
            label="菜单名称"
            align = "center"
            prop = "menuName"
            width="260">
            </el-table-column>
            <el-table-column
            prop="menuPath"
            align = "center"
            label="菜单路径"
            width="240">
                <template slot-scope="scope">
                    <p style="color: #909399;" v-if="checkNull(scope.row.menuPath)">无菜单路径</p>
                    <p v-if="!checkNull(scope.row.menuPath)"><el-link type="primary">{{scope.row.menuPath}}</el-link></p>
                </template>
            </el-table-column>
            <el-table-column
                label="图标"
                align = "center"
                width="180">
                <template slot-scope="scope">
                    <p style="color: #909399;" v-if="checkNull(scope.row.icon)">没有对应的图标</p>
                    <p v-if="!checkNull(scope.row.icon)"><i style="color: #409EFF;" class="el-icon-platform-eleme"></i> {{scope.row.icon}}</p>
                </template>
            </el-table-column>
            <el-table-column
                prop="introduce"
                align = "center"
                label="简介">
                <template slot-scope="scope">
                    <p style="color: #909399;" v-if="checkNull(scope.row.introduce)">暂无介绍</p>
                    <p v-if="!checkNull(scope.row.introduce)">{{scope.row.introduce}}</p>
                </template>
            </el-table-column>
            <el-table-column align = "center" width = "250">
            <template slot="header" slot-scope="scope">
                <el-button
                size="small"
                plain
                type="success"
                icon = "el-icon-document-add"
                @click="handleAddParent">添加一级菜单</el-button>
            </template>
            <template slot-scope="scope">
                
                <el-tooltip content="编辑" placement="bottom" effect="light">
                    <el-button
                    size="mini"
                    type = "primary"
                    circle
                    icon = "el-icon-edit"
                    @click="handleEdit(scope.row)"></el-button>
                </el-tooltip>

                <el-tooltip content="删除" placement="bottom" effect="light">
                    <el-button
                    size="mini"
                    type="danger"
                    circle
                    icon = "el-icon-delete"
                    @click="handleDelete(scope.row.id)"></el-button>
                </el-tooltip>

                <el-tooltip content="添加子菜单" placement="bottom" effect="light">
                    <el-button
                    size="mini"
                    circle
                    type="success"
                    icon = "el-icon-plus"
                    @click="handleAddChild(scope.row.id)"></el-button>
                </el-tooltip>
                

                <el-tooltip content="上移" placement="bottom" effect="light">
                    <el-button
                    size="mini"
                    type="text"
                    icon = "el-icon-top"
                    @click="handleUp(scope.row.id)"></el-button>
                </el-tooltip>
                

                <el-tooltip content="下移" placement="bottom" effect="light">
                    <el-button
                    size="mini"
                    type="text"
                    icon = "el-icon-bottom"
                    @click="handleDown(scope.row.id)"></el-button>
                </el-tooltip>
                
            </template>
            </el-table-column>
        </el-table>

        <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" @close = "close">
            <el-form :model="dialogForm" :rules = "rules" ref = "dialogForm">
              <el-form-item label="菜单名称" :label-width="formLabelWidth" prop = "menuName">
                <el-input v-model="dialogForm.menuName" autocomplete="off" placeholder="请输入菜单名称"></el-input>
              </el-form-item>
              <el-form-item label="菜单路径" :label-width="formLabelWidth" prop = "menuPath">
                <el-input v-model="dialogForm.menuPath" autocomplete="off" placeholder="形如 /home/xxxx，父菜单可以不填"></el-input>
              </el-form-item>
              <el-form-item label="菜单图标" :label-width="formLabelWidth" prop = "icon">
                <el-input v-model="dialogForm.icon" autocomplete="off" placeholder="类似 el-icon-edit,请参照elementUI官网"></el-input>
              </el-form-item>
              <el-form-item label="菜单介绍" :label-width="formLabelWidth" prop = "introduce">
                <el-input type = "textarea" placeholder="对该菜单的介绍" v-model="dialogForm.introduce" :rows = "4" autocomplete="off" maxlength="100" show-word-limit></el-input>
              </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
              <el-button @click="dialogVisible = false">取 消</el-button>
              <el-button type="primary" @click="submitData">确 定</el-button>
            </div>
        </el-dialog>
    </el-card>
</template>
<script>
import {getAllMenuAPI,addMenuAPI,editMenuAPI,delMenuAPI,upMenuAPI,downMenuAPI} from '@/request/sys_api'
import _global from '@/assets/js/global.js'
export default {
    inject:['reload'],
    data() {
        return {
            dialogVisible:false,
            dialogForm:{
                id:null,
                pid:null,
                menuName:'',
                menuPath:'',
                icon:'',
                introduce:''
            },
            formLabelWidth: '120px',
            dialogTitle:'',
            rules: {
                menuName: [{ required: true, message: '请输入菜单名称', trigger: 'blur' }]
            },
            tableTree:[],
            boxCardStyle:'height:98%;'
        }
    
    },
    mounted(){
        this.boxCardStyle = _global.boxCardStyle;
        this.getMenuData();
    },
    methods: {
        getMenuData(){
            getAllMenuAPI().then(function(res){
                // console.log(res)
                this.tableTree = res.data.data.menuList;
            }.bind(this))
        },
        checkNull(data){
            if(data == ''||data == null || data.trim() == ''){
                return true;
            }
            return false;
        },
        close(){
            this.$refs.dialogForm.resetFields();//必须要在重置数据前面
            this.dialogForm.id = null;
            this.dialogForm.pid = null;
            this.dialogForm.introduce = '';
            this.dialogForm.menuName = '';
            this.dialogForm.menuPath = '';
            this.dialogForm.icon = '';
        },
        handleAddParent(){
            this.dialogTitle = "添加一级菜单";
            this.dialogForm.pid = 0;
            this.dialogVisible = true;
        },
        handleAddChild(id){
            this.dialogTitle = "添加子菜单";
            this.dialogForm.pid = id;
            this.dialogVisible = true;
        },
        handleUp(id){
            upMenuAPI(id).then(function(res){
                if(res.data.success){
                    // this.reload();
                    this.getMenuData();
                }else{
                    this.$message.warning(res.data.message);
                }
            }.bind(this))
        },
        handleDown(id){
            downMenuAPI(id).then(function(res){
                if(res.data.success){
                    // this.reload();
                    this.getMenuData();
                }else{
                    this.$message.warning(res.data.message);
                }
            }.bind(this))
        },
        handleEdit(row){
            this.dialogTitle = "修改菜单项";
            this.dialogForm.id = row.id;
            this.dialogForm.menuName = row.menuName;
            this.dialogForm.menuPath = row.menuPath;
            this.dialogForm.introduce = row.introduce;
            this.dialogForm.icon = row.icon;
            this.dialogVisible = true;
        },
        handleDelete(id){
            this.$confirm('此操作将永久删除该条记录, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                delMenuAPI(id).then(function(res){
                    if(res.data.success){
                        this.$message.success(res.data.message)
                        this.reload()
                    }else{
                        this.$message.warning(res.data.message)
                    }
                }.bind(this))
            })
        },
        submitData(){
            this.$refs.dialogForm.validate((valid) => {
            if (valid) {
                //修改菜单
                if(this.dialogForm.id != null){
                    editMenuAPI(this.dialogForm).then(function(res){
                        if(res.data.success){
                            this.$message.success(res.data.message);
                            this.reload();
                        }else{
                            this.$message.error(res.data.message);
                        }
                    }.bind(this))
                }else{
                    //添加菜单
                    addMenuAPI(this.dialogForm).then(function(res){
                        if(res.data.success){
                            this.$message.success(res.data.message);
                            this.reload();
                        }else{
                            this.$message.error(res.data.message);
                        }
                    }.bind(this))
                }
            
          }
        });
      }
    }
}
</script>
<style scoped>

</style>
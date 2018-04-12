<?php
namespace app\admin\controller;

use think\Controller;

class Admin extends Controller
{

    public function add() {
        // 判定是否是post提交
        if(request()->isPost()) {
            // 打印提交的数据
            //dump(input('post.'));  halt(); => dump() ; exit
            $data = input('post.');
            // validate
            $validate = validate('AdminUser');
            if(!$validate->check($data)) {
                $this->error($validate->getError());
            }

            $data['password'] = md5($data['password'].'_#sing_ty');
            $data['status'] = 1;

            // 1 exception
            // 2 add id
            try {
                $id = model('AdminUser')->add($data);
            }catch (\Exception $e) {
                $this->error($e->getMessage());
            }

            if($id) {
                $this->success('id='.$id.'的用户新增成功');
            }else {
                $this->error('error');
            }

        }else {
            return $this->fetch();
        }
    }
}

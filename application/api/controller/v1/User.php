<?php
/**
 * Created by PhpStorm.
 * User: baidu
 * Date: 17/8/5
 * Time: 下午4:37
 */
namespace app\api\controller\v1;

use app\api\controller\Common;
use think\Controller;
use app\common\lib\exception\ApiException;
use app\common\lib\Aes;
use app\common\lib\IAuth;


class User extends AuthBase {
	
	/*
	* 获取用户信息
	* 用户信息需要加密处理
	*/
	public function read(){
		$obj = new Aes();
		return show(config('code.success'), 'ok', $obj->encrypt($this->user));
	} 

	/*
	* 用户信息修改
	*/
	public function update(){
		$postData = input('param.');
		//验证

		$data = [];
		if(!empty($postData['username'])){
			$res = $this->checkNickName($postData['username']);
			if(empty($this->checkNickName($postData['username']))){		
				$data['username'] = $postData['username'];
			}else{
				return show(config('code.error'), '该昵称已存在', [], 404);
			}		
		}

		if(!empty($postData['signature'])){
			$data['signature'] = $postData['signature'];
		}

		if(!empty($postData['password'])){
			//传输过程需加密
			$data['password'] = IAuth::setPassword($postData['password']);
		}

		if(!empty($postData['image'])){
			$data['image'] = $postData['image'];
		}

		if(!empty($postData['sex'])){
			$data['sex'] = $postData['sex'];
		}

		if(empty($data)){
			return show(config('code.error'), '用户数据不合法', [], 404);
		}

		try{
			$id = model('User')->save($data, ['id' => $this->user->id]);
			if($id){
				return show(config('code.success'), '更新成功', [] ,202);
			}else{
				return show(config('code.error'), '更新失败', [] , 401);
			}
		}catch(\Exception $e){
			return show(config('code.error'), $e->getMessage(), [], 500);
		}	
	}

	/*
	* 检测昵称是否存在
	* @return boolen
	*/
	public function checkNickName($name = ''){
		$user = model('User')->where('username',$name)->find();
		if($user){
			return true;			
		}
		return false;		
	}
}

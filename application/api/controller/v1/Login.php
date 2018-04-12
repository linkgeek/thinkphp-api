<?php

/**
* 登录
*/

namespace app\api\controller\v1;

use app\api\controller\Common;
use think\Controller;
use app\common\lib\exception\ApiException;
use app\common\lib\Aes;
use app\common\lib\IAuth;
use app\common\lib\Alidayu;
use app\common\model\User;

class Login extends Common
{
	
	public function save(){
		if(!request()->isPost()){
			return show(config('code.error'), '无权限', '', 403);
		}

		$param = input('param.');
		if(empty($param['phone'])){
			return show(config('code.error'), '手机号不合法', '', 404);
		}
		if(empty($param['code']) && empty($param['password'])){
			return show(config('code.error'), '手机验证码或密码不能同时为空', '', 404);
		}
		if(!empty($param['code'])){
			$code = Alidayu::getInstance()->checkSmsIdentify($param['phone']);
			if($code != $param['code']){
				return show(config('code.error'), '手机验证码不正确', '', 404);
			}
		}
		
		$token = IAuth::setAppLoginToken($param['phone']);
		$data = [
			'token' => $token,
			'time_out' => strtotime("+".config('app.app_login_time_out')."days"),
		];

		//查找  存在就更新
		$user = User::get(['phone'=>$param['phone']]);
		if ($user && $user->status == 1){
			if(!empty($param['password'])){
				if(IAuth::setPassword($param['password']) != $user->password){
					return show(config('code.error'), '密码不正确', '', 403);
				}
			}

			$id = model('User')->save($data, ['phone' => $param['phone']]);
		} else{
			//第一次登录 注册数据
			if(!empty($param['code'])){
				$data = [
					'username' => "游客",
					'status' => 1,
					'phone' => $param['phone']
				];
				$id = model('User')->add($data);
			}else{
				return show(config('code.error'), '用户不存在', [], 403);
			}		
		}

		$obj = new Aes();
		if($id){
			$result = [
				'token' => $obj->encrypt($token."||".$id),
			];
			return show(config('code.success'), 'ok', $result, 200);
		}else{
			return show(config('code.error'), '登录失败', [], 403);
		}	
	}



}

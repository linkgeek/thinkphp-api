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
use app\common\model\User;

class AuthBase extends Common {
	/*用户登录信息*/
	public $user = [];

	/*初始化*/
	public function _initialize(){
		parent::_initialize();
		if(empty($this->isLogin())){
			throw new ApiException('您没登录',401);
		}
	}

	/*
 	* 判断是否登录
 	* @return boolen
	*/
	public function isLogin(){
		if(empty($this->headers['access_user_token'])){			
			return false;
		}

		$obj = new Aes();
		$accessUserToken = $obj->decrypt($this->headers['access_user_token']);

		if(empty($accessUserToken)){
			return false;
		}
		if(!preg_match('/||/', $accessUserToken)){
			return false;
		}
		list($token, $id) = explode("||", $accessUserToken);
		$user = User::get(['token' => $token]);
		if(!$user || $user->status !=1){
			return false;
		}
		//判断是否过期
		if(time() > $user->time_out){
			return false;
		}
		$this->user = $user;
		return true;
	}


}
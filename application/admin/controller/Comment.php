<?php
namespace app\admin\controller;

use think\Controller;


/**
* 评论管理
*/
class Comment extends Base
{
	/*评论列表*/
	public function index(){
		$data = model('Comment')->getAdminComment();
		$this->assign('commentData',$data);
		return $this->fetch();
	}
}
<?php 

namespace app\admin\model;

use think\Model;

/**
* 评论
*/
class Comment extends Model
{
	
	public function getAdminComment(){
		return $this->paginate(5);
	}
}
<?php

namespace app\common\model;
use think\Model;
use think\Db;

class Comment extends Base {

	/*
	* 获取评论条数
	* @param array
	*/
	public function getCommentCount($param=[]){
		$count = Db::table('ent_comment')->alias(['ent_comment'=>'c','ent_user'=>'u'])->join('ent_user','c.user_id = u.id AND c.status=1 AND c.news_id='.$param['news_id'])->count();
		return $count;
	}

	/*
	* 获取评论内容 
	* @param array $param
	* @param int $from
	* @param int $size
	* @return array
	*/
	public function getCommentData($param=[],$from=0,$size=5){
		$result = Db::table('ent_comment')
			->alias(['ent_comment'=>'c','ent_user'=>'u'])
			->join('ent_user','c.user_id = u.id AND c.status=1 AND c.news_id='.$param['news_id'])
			->limit($from,$size)
			->order(['u.id'=>'desc'])
			->select();
		return $result;
	}

	/*
	* 获取评论条数 优化方法
	* @param array
	*/
	public function getCount($param=[]){
		return $this->where($param)->field('id')->count();
	}

	/*
	* 获取评论列表 优化方法
	* @param array
	*/
	public function getCommentList($param=[],$from=0,$size=5){		
		return $this->where($param)
			->field('*')
			->limit($from,$size)
			->order(['id'=>'desc'])
			->select();
	}
}
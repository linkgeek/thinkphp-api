<?php
namespace app\api\controller\v1;

use think\Controller;
use app\api\controller\v1\AuthBase;


/**
* 新闻评论
*/
class Comment extends AuthBase
{
	/*
	* 评论 -- 回复保存
	*/
	public function save(){
		$data = input('post.',[]);

		if(empty($data['news_id'])){
			return show(config('code.error'), '新闻参数不合法', [], 404);
		}

		if(empty($data['content'])){
			return show(config('code.error'), '评论内容不能为空', [], 404);
		}

		$data['user_id'] = $this->user->id;

		try {
			$commentId = model('Comment')->save($data);
			if($commentId){
				return show(config('code.success'), '评论成功', [], 202);
			}else{
				return show(config('code.error'), '评论失败', [], 500);
			}
		} catch (\Exception $e) {
			return show(config('code.error'), '评论失败', [], 500);
		}
	}

	/*
	* 获取评论列表  方法一
	*/
	public function read111(){
		$news_id = input('param.id',0 ,'intval');
		if(empty($news_id)){
			return show(config('code.error'), 'id不存在', [], 404);
		}

		$param['news_id'] = $news_id;
		$count = model('Comment')->getCommentCount($param);

		$this->getPageAndSize(input('param.'));
		$comments = model('Comment')->getCommentData($param,$this->from, $this->size);
		$result = [
            'total' => $count,
            'page_num' => ceil($count / $this->size),
            'list' => $comments,
        ];

        return show(config('code.success'), 'OK', $result, 200);
	}

	/*
	* 获取评论列表  方法二
	*/
	public function read(){
		$news_id = input('param.id',0 ,'intval');
		if(empty($news_id)){
			return show(config('code.error'), 'id不存在', [], 404);
		}

		$param['news_id'] = $news_id;
		$count = model('Comment')->getCount($param);
		
		$this->getPageAndSize(input('param.'));
		$comments = model('Comment')->getCommentList($param,$this->from, $this->size);

		if($comments){
			foreach ($comments as $comment) {
				$userIds[] = $comment['user_id'];
				if($comment['to_user_id']){
					$userIds[] = $comment['to_user_id'];
				}
			}
			$userIds = array_unique($userIds);
		}

		$userIds = model('User')->getUserId($userIds);
		if(empty($userIds)){
			$userIdNames = [];
		}else{
			foreach ($userIds as $userId) {
				$userIdNames[$userId->id] = $userId;
			}
		}

		$resultData = [];
		foreach ($comments as $comment) {
			$resultData[] = [
				'id' => $comment->id,
				'user_id' => $comment->user_id,
				'to_user_id' => $comment->to_user_id,
				'content' => $comment->content,
				'username' => !empty($userIdNames[$comment->user_id]) ? $userIdNames[$comment->user_id]->username : '',
				'to_username' => !empty($userIdNames[$comment->to_user_id]) ? $userIdNames[$comment->to_user_id]->username : '',
				'parent_id' => $comment->parent_id,
				'create_time' => $comment->create_time,
				'image' => !empty($userIdNames[$comment->user_id]) ? $userIdNames[$comment->user_id]->image : '',
			];
		}

		$result = [
            'total' => $count,
            'page_num' => ceil($count / $this->size),
            'list' => $resultData,
        ];

        return show(config('code.success'), 'OK', $result, 200);
	}

	public function delete(){

	}
}
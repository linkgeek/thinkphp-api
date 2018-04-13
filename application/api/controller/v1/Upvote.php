<?php
namespace app\api\controller\v1;

/**
* 用户点赞
*/

use think\Controller;
use app\api\controller\v1\AuthBase;
use app\common\model\UserNews;

class Upvote extends AuthBase
{
	/*保存点赞*/
	public function save(){
		$new = input('param.');
		if(empty($new['id'])){
			return show(config('code.error'), '新闻参数不合法', [], 404);
		}

		$id = model('News')->get(['id'=>$new['id']]);
		if(empty($id)){
			return show(config('code.error'), '新闻不存在', [], 404);
		}

		$data = [
			'user_id' => $this->user->id,
			'news_id' => $new['id']
		];

		//判断是否已点赞
		$result = model('UserNews')->get($data);
		if($result){
			return show(config('code.success'), '你已点赞');
		}
		
		try{
			$res = model('UserNews')->save($data);
			if($res){
				model('News')->where(['id' => $new['id']])->setInc('upvote_count');
				return show(config('code.success'), '点赞成功');
			}else{
				return show(config('code.error'), '点赞出错', [], 401);
			}
		}catch(\Exception $e){
			return show(config('code.error'), $e->getMessage(), [], 500);
		}
	}

	/*取消点赞*/
	public function delete(){
		$new = input('param.');
		if(empty($new['id'])){
			return show(config('code.error'), '新闻参数不合法', [], 404);
		}

		$id = model('News')->get(['id'=>$new['id']]);
		if(empty($id)){
			return show(config('code.error'), '新闻不存在', [], 404);
		}

		$data = [
			'user_id' => $this->user->id,
			'news_id' => $new['id']
		];

		$result = model('UserNews')->get($data);
		if(empty($result)){
			return show(config('code.error'), '没有被你点赞过', [], 401);
		}

		try {
			$res = model('UserNews')->where($data)->delete();
			if($res){
				model('News')->where(['id' => $new['id']])->setDec('upvote_count');
				return show(config('code.success'), '取消点赞成功');
			}else{
				return show(config('code.error'), '取消点赞出错', [], 500);
			}
		} catch (\Exception $e) {
			return show(config('code.error'), '取消点赞出错', [], 500);
		}
	}

	/*判断文章是否被用户点赞*/
	public function read(){
		$id = input('param.id', 0, 'intval');
		if(empty($id)){
			return show(config('code.error'), 'id不存在', [], 404);
		}

		$newId = model('News')->get(['id'=>$id]);
		if(empty($newId)){
			return show(config('code.error'), '新闻id不存在', [], 404);
		}

		$data = [
			'user_id' => $this->user->id,
			'news_id' => $id
		];

		$result = model('UserNews')->get($data);
		if($result){
			return show(config('code.success'), '点赞过', ['isUpvote'=>1], 200);
		}else{
			return show(config('code.success'), '没有点赞', ['isUpvote'=>0], 200);
		}
	}
}
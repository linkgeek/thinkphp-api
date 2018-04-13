<?php

namespace app\common\model;
use think\Model;

class User extends Base {

	public function getUserId($userIds = []){
		$param = [
			'id' => ['in', implode(',', $userIds)],
			'status' => 1,
		];
		$order = [
			'id' => 'desc',
		];

		return $this->where($param)
			->field(['id','username','image'])
			->order($order)
			->select();
	}
}
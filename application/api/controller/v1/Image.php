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
use app\common\lib\Upload;

class Image extends AuthBase {
	
	/*
	* 图片上传
	* 
	*/
	public function save(){
		//print_r($_FILES);
		$image = Upload::image();
		if($image){
			return show(config('code.success'), 'ok', config('qiniu.image_url').'/'.$image);
		}
	} 
}

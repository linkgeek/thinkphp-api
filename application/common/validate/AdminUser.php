<?php
/**
 * Created by PhpStorm.
 * User: baidu
 * Date: 17/7/27
 * Time: 下午5:25
 */
namespace app\common\validate;

use think\Validate;
class AdminUser extends Validate {

    protected $rule = [
        'username' => 'require|max:20',
        'password' => 'require|max:20',
    ];
}
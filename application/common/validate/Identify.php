<?php
/**
 * Created by PhpStorm.
 * User: baidu
 * Date: 17/7/27
 * Time: 下午5:25
 */
namespace app\common\validate;

use think\Validate;
class Identify extends Validate {

    protected $rule = [
        'id' => 'require|number|length:11',
    ];
}
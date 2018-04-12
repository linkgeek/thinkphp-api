<?php
namespace app\admin\controller;

use think\Controller;

class Index extends Base
{
    public function index()
    {
        //halt(session(config('admin.session_user'), '', config('admin.session_user_scope')));
        return $this->fetch();
    }

    public function welcome() {
        return "hello api-admin";
    }
}

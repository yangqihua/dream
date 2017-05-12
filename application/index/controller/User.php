<?php

namespace app\index\controller;

use think\Controller;

class User extends Controller
{

    public function _initialize()
    {
        $user = session("ext_user");
        if(!$user){
            $this->redirect("index/index");
        }

    }

    public function index()
    {
        return view();
    }

    // 退出登录
    public static function logout()
    {
        session("ext_user", NULL);
        return [
            "code" => 0,
            "desc" => "退出成功"
        ];
    }


}

<?php

namespace app\index\controller;

use think\Controller;

class Index extends Controller
{
    public function _initialize()
    {
//        echo 'init<br/>';
    }

    public function index()
    {
//        echo dump($_SERVER);exit;
        return view();
    }

    //登录
    public function login()
    {
        $username = input('username');
        $password = input('password');
        $user = model('User');
        $data = $user->where('username', $username)
            ->where('password', $password)
            ->find();
        if ($data) {
            unset($user["password"]);
            session("ext_user", $data);
            return ['message'=>'登录成功','code'=>200,'data'=>null];
        } else {
            return ['message'=>'用户名或密码错误','code'=>500,'data'=>null];
        }
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

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
        $user = session("ext_user");
        $this->assign("username",$user['username']);
        return view();
    }

    public function edit_userinfo()
    {
        $user = session("ext_user");
        $this->assign("user",$user);
        return view();
    }

    // 退出登录
    public function logout()
    {
        session("ext_user", NULL);
        $this->redirect("index/index");
    }


}

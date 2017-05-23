<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

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
        if( null==$user['birthday']||''==$user['birthday']){
            $user['birthday']='1994-11-02 11:02';
        }
        $this->assign("user",$user);
        return view();
    }

    // 退出登录
    public function logout()
    {
        session("ext_user", NULL);
        $this->redirect("index/index");
    }

    public function submit_edit_userinfo(){
        $data['userId'] = input('userId');
        $data['username'] = input('username');
        $data['password'] = input('password');
        $data['birthday'] = input('birthday').":00";

        $res = Db::table('user')->where('id',$data['userId'])->update([
            'username'=>$data['username'],
            'password'=>$data['password'],
            'birthday'=>$data['birthday'],
        ]);
        $user = session("ext_user");
        $user['username']=$data['username'];
        $user['password']=$data['password'];
        $user['birthday']=$data['birthday'];
        session("ext_user", $user);
//        if($res){
            return ['message'=>'更新用户资料成功','code'=>200,'data'=>null];
//        }else{
//            return ['message'=>'更新用户资料失败','code'=>500,'data'=>null];
//        }
    }


}

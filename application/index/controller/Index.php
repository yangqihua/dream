<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Controller
{

    public function index()
    {
        return view();
    }

    public function register()
    {
        return view();
    }

    public function submit_register()
    {
        $data['username'] = input('username');
        $data['password'] = input('password');
        $data['birthday'] = input('birthday');

        $res = Db::table('user')->where('username',$data['username'])->find();
        if($res){
            return ['message'=>'该用户名已被注册','code'=>500,'data'=>null];
        }else{
            Db::table('user')->insert($data);
            return ['message'=>'登录成功','code'=>200,'data'=>null];
        }
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

            $dreams = Db::table('dream')->where('user_id', $data['id'])->select();
            foreach ($dreams as $dream){
                $period = $dream['period']*24*3600;
                $create_time = strtotime($dream['create_time']);
                $delta = time() - $create_time;
                for($i=0;$i<intval($delta/$period);$i++){
                    $warn_date = date('Y-m-d',$create_time+$period*$i);
                    $warn = Db::table('warn')->where('warn_date', $warn_date)->where('dream_id',$dream['id'])->find();
                    if(!$warn){
                        Db::table('warn')->insert(['dream_id'=>$dream['id'],'warn_date'=>$warn_date,'user_id'=>$data['id']]);
                    }
                }
            }

            return ['message'=>'登录成功','code'=>200,'data'=>null];
        } else {
            return ['message'=>'用户名或密码错误','code'=>500,'data'=>null];
        }
    }


}

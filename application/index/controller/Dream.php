<?php
/**
 * Created by PhpStorm.
 * User: yangqihua
 * Date: 2017/5/11
 * Time: 下午12:09
 */

namespace app\index\controller;

use think\Controller;

class Dream extends Controller
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
        $this->redirect("poll");
    }

    public function poll()
    {
        return view();
    }

    public function sheet()
    {
        return view();
    }

    public function me()
    {
        return view();
    }
}
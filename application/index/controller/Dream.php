<?php
/**
 * Created by PhpStorm.
 * User: yangqihua
 * Date: 2017/5/11
 * Time: 下午12:09
 */

namespace app\index\controller;

use think\Controller;
use think\Db;

class Dream extends Controller
{

    public function _initialize()
    {
        $user = session("ext_user");
        if (!$user) {
            $this->redirect("index/index");
        }

    }

    public function index()
    {
        $this->redirect("poll");
    }

    public function poll()
    {
        $dreamListLength = count($this->getFormatPolls(10));
        $this->assign("dreamListLength", $dreamListLength);
        return view();
    }

    public function getPolls()
    {
        return $this->getFormatPolls(10);
    }

    private function getFormatPolls($pageSize = 10)
    {
        $data = Db::table('dream')->where('is_public', 1)
            ->alias('d')->join('user u', 'd.user_id = u.id')
            ->field('d.id as id,title,content,username,d.create_time as create_time,upvote_count,comment_count')
            ->order("create_time", "desc")
            ->paginate($pageSize);
        $list = $data->toArray()['data'];
        $result = [];
        for ($i = 0; $i < count($list); $i++) {
            $userId = session("ext_user")['id'];
            $dreamId = $list[$i]['id'];
            $res = Db::table('upvote')->where('user_id', $userId)->where('dream_id', $dreamId)->find();
            if ($res) {
                $list[$i]['is_vote'] = 1;
            } else {
                $list[$i]['is_vote'] = 0;
            }
            $list[$i]['create_time'] = format_time($list[$i]['create_time']);
            $result[] = $list[$i];
        }
        return $result;
    }

    public function upvote()
    {
        $dreamId = input("dreamId", 0);
        $userId = session("ext_user")['id'];
        $res = Db::table('upvote')->where('user_id', $userId)->where('dream_id', $dreamId)->find();
        if ($res) {
            Db::table('upvote')->where('user_id', $res['user_id'])->where('dream_id', $res['dream_id'])->delete();
            Db::table('dream')->where('id', $dreamId)->setDec('upvote_count');

            return ["message" => "添加成功", "code" => 200, "is_upvote" => 0];
        } else {
            $data = ['dream_id' => $dreamId, 'user_id' => $userId, 'create_time' => date('Y-m-d H:m:s', time())];
            Db::name('upvote')->insert($data);

            Db::table('dream')->where('id', $dreamId)->setInc('upvote_count');
            return ["message" => "添加成功", "code" => 200, "is_upvote" => 1];
        }
    }


    public function sheet()
    {
        return view();
    }

    public function get_sheet_detail()
    {
        $sheetId = input("sheetId");
//        print_r($sheetId);exit();
        $data = Db::table('dream')->where('d.id', $sheetId)
            ->alias('d')->join('user u', 'd.user_id = u.id')
            ->field('d.id as id,title,content,username,d.create_time as create_time,upvote_count,comment_count')
            ->find();
        $this->assign("dream", $data);
        return view();
    }

    public function edit_dream()
    {
        $dreamId = input("dreamId");
        $data = Db::table('dream')->where('id', $dreamId)->find();
        $this->assign("dream", $data);
        return view();
    }

    public function deleteDream()
    {
        $dreamId = input("dreamId");
        $data = Db::table('dream')->where('id', $dreamId)
            ->delete();
        return $data;
    }

    public function getSheet()
    {
        $pageSize = input("pageSize", 10);
        $userId = session("ext_user")['id'];
        $data = Db::table('dream')->where('user_id', $userId)
            ->alias('d')->join('user u', 'd.user_id = u.id')
            ->field('d.id as id,title,content,username,d.create_time as create_time,upvote_count,comment_count')
            ->order("create_time", "desc")
            ->paginate($pageSize);
        $list = $data->toArray()['data'];
        $result = [];
        for ($i = 0; $i < count($list); $i++) {
            $userId = session("ext_user")['id'];
            $dreamId = $list[$i]['id'];
            $res = Db::table('upvote')->where('user_id', $userId)->where('dream_id', $dreamId)->find();
            if ($res) {
                $list[$i]['is_vote'] = 1;
            } else {
                $list[$i]['is_vote'] = 0;
            }
            $list[$i]['create_time'] = format_time($list[$i]['create_time']);
            $result[] = $list[$i];
        }
        return $result;
    }

    public function addSheet()
    {
        $dream = model("Dream");

        $id = input("dreamId", "");
        $dream->title = input("title", "");
        $dream->content = input("content", "");
        $dream->is_finished = 0;
        $dream->period = input("period", "7", "intval");
        $dream->is_public = input("is_public", "0", "intval");
        $dream->user_id = session("ext_user")['id'];
        $dream->upvote_count = 0;
        $dream->comment_count = 0;
        if ("" == $id) {
            $dream->save();
            return ["message" => "添加成功", "code" => 200];
        }
        $dream->where('id',$id)->update([
            'title'=>$dream->title,
            'content'=>$dream->content,
            'period'=>$dream->period,
            'is_public'=>$dream->is_public,
        ]);
        return ["message" => "更新成功", "code" => 200];

    }

    public function warn(){
        return view();
    }

    public function getWarn(){
        $pageSize = input("pageSize", 10);
        $userId = session("ext_user")['id'];
        $warns = Db::table('warn')->where('w.user_id', $userId)
            ->alias('w')
            ->join('user u', 'w.user_id = u.id')
            ->join('dream d', 'd.id = w.dream_id')
//            ->field('d.id as id,title,content,username,d.create_time as create_time,upvote_count,comment_count')
            ->order("warn_date", "desc")
            ->paginate($pageSize);
        $list = $warns->toArray()['data'];
        return $list;
    }

    public function publish()
    {
        return view();
    }

    public function me()
    {
        return view();
    }
}
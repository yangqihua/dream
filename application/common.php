<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

function format_time($time_data)
{
    $ts = strtotime($time_data);
    $delta = time() - $ts;
    $years = intval($delta / (3600 * 24 * 365));
    $months = intval($delta / (3600 * 24 * 30));
    $days = intval($delta / (3600 * 24));
    $hours = intval($delta / 3600);
    $minis = intval($delta / 60);
    if ($years >= 1)
        return $years.'年前';
    if ($months >= 1)
        return  $months.'个月前';
    if ($days >= 1)
        return $days.'天前';
    if ($hours >= 1)
        return $hours."小时前";
    if ($minis >= 1)
        return $minis."分钟前" ;
    return "刚刚";

}

# 运行环境

[![platform](https://img.shields.io/badge/platform-Android-green.svg)](https://www.android.com)
[![](https://img.shields.io/badge/Magisk-v26.1-blue)](https://github.com/topjohnwu/Magisk/releases/tag/v26.1)

## 主要更新日志
    - 以往更新日志因为过于久远已删除
    - 4.20 更新iptables代码
    - 4.23 更改一些功能的运行逻辑，简化配置文件
    - 4.28 简化脚本代码，更新脚本运行逻辑
    - 5.20 抛弃脚本命令行，改为独立的程序，在原有的功能上加入了更多的新功能；优化iptables执行逻辑
    - 6.08 利用iptables命令屏蔽stun端口以阻止WebRtc泄露真实IP；优化本地dns处理逻辑

## 热点机固定IP可用此XP模块
    - https://github.com/XhyEax/SoftApHelper

## 可根据需要访问对应地址打开操控面板
    - 本机
      地址：http://localhost:619/ui/?theme=light
    - 路由
      地址：http://${网关IP}:619/ui/?theme=light#/
      端口：http://${网关IP}:619
      密码：${见配置文件}

## 使用教程
    请阅读配置文件

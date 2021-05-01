# Genshin Daily Bonus

Forked from [PeterPanZH / genshin-impact-helper](https://github.com/PeterPanZH/genshin-impact-helper)

<div align="center">
<h1 align="center">Genshin Impact Helper</h1>

![Genshin Impact Helper](https://i.loli.net/2020/11/18/3zogEraBFtOm5nI.jpg)

</div>

## 🌀简介

Genshin Impact Helper 可以自动化为你获取原神每日福利。

## 💡特性

- [x] **自动签到**  程序会在每天早上自动执行签到流程，也可以随时通过部署教程的`步骤4`手动触发，具体时间参照[此处](.github/workflows/main.yml)
- [x] **支持同步**  自动同步上游仓库，默认关闭
- [x] **支持订阅**  可选多种订阅方式，通过配置不同参数开启，每天将签到结果推送给订阅用户
- [x] **支持多账号**  不同账号的`Cookie`值之间用`#`分隔，如：`Cookie1#Cookie2#Cookie3`
- [x] **支持多角色**  支持绑定官服和B站渠道服角色的米游社账号
- [x] **微博超话签到**  推荐本地运行，异地IP可能会失败
- [x] **原神超话领码**  自动领取兑换码并推送给订阅用户

## 🧬参数

在`Settings`-->`Secrets`里添加的参数，`Name`必须为下列的参数名称之一，`Value`则填写对应获取的值

|   参数名称         |   是否必填   |   默认值           |   说明                                                          |
|---                |---          |---                 |---                                                              |
|   COOKIE          | ✅         |                    |   米游社的Cookie                                                 |
|   OS_COOKIE          | ❌         |                    |   米游社国际版的Cookie                                                 |
|   WB_COOKIE       | ❌         |                    |   新浪微博的Cookie                                                 |
|   KA_COOKIE       | ❌         |                    |   新浪新手卡中心的Cookie                                                 |
|   SCKEY           | ❌         |                    |   Server酱的SCKEY                                                |
|   COOL_PUSH_SKEY  | ❌         |                    |   Cool Push的SKEY                                                |
|   COOL_PUSH_MODE  | ❌         | send               |   Cool Push的推送方式.可选私聊(send)、群组(group)或者微信(wx).      |
|   BARK_KEY        | ❌         |                    |   Bark的IP或设备码                                                |
|   BARK_SOUND      | ❌         | healthnotification |   Bark的推送铃声.在APP内查看铃声列表                                |
|   TG_BOT_API      | ❌         | api.telegram.org   |   Telegram 的API地址 (可以自定义为反向代理服务器)                       |
|   TG_BOT_TOKEN    | ❌         |                    |   Telegram Bot的token.向bot father申请bot时生成                    |
|   TG_USER_ID      | ❌         |                    |   Telegram推送对象的用户ID                                         |
|   DD_BOT_TOKEN    | ❌         |                    |   钉钉机器人WebHook地址中access_token后的字段                       |
|   DD_BOT_SECRET   | ❌         |                    |   钉钉加签密钥.在机器人安全设置页面,加签一栏下面显示的以SEC开头的字符串 |
|   WW_BOT_KEY      | ❌         |                    |   企业微信机器人WebHook地址中key后的字段                             |
|   WW_ID           | ❌         |                    |   企业微信的企业ID(corpid).在'管理后台'->'我的企业'->'企业信息'里查看  |
|   WW_APP_SECRET   | ❌         |                    |   企业微信应用的secret.在'管理后台'->'应用与小程序'->'应用'->'自建',点进某应用里查看|
|   WW_APP_USERID   | ❌         | @all               |   企业微信应用推送对象的用户ID.在'管理后台'->'通讯录',点进某用户的详情页里查看   |
|   WW_APP_AGENTID  | ❌         |                    |   企业微信应用的agentid.在'管理后台'->'应用与小程序'->'应用',点进某应用里查看   |
|   IGOT_KEY        | ❌         |                    |   iGot的KEY                                                         |
|   PUSH_PLUS_TOKEN | ❌         |                    |   pushplus一对一推送或一对多推送的token                               |
|   PUSH_PLUS_USER  | ❌         | 一对一推送          |   pushplus一对多推送的群组编码                                        |
|   PUSH_CONFIG     | ❌         |                    |   JSON格式的自定义推送配置.详见 订阅-自定义推送 部分说明                |
|   CRON_SIGNIN     | ❌         | 30 9 * * *         |   DOCKER脚本的自动签到计划任务                                        |

## 🔨开发

如果需要重构或增加额外功能可参考以下数据：

<details>
<summary>查看数据</summary>

```python
# 角色信息
roles = Roles(cookie).get_roles()
roles = {
    'retcode': 0,
    'message': 'OK',
    'data': {
        'list': [
            {
                'game_biz': 'hk4e_cn',
                'region': 'cn_gf01',
                'game_uid': '111111111',
                'nickname': '酸柚子',
                'level': 48,
                'is_chosen': False,
                'region_name': '天空岛',
                'is_official': True
            }
        ]
    }
}
```
```python
# 签到信息
infos = Sign(cookie).get_info()
infos = [
    {
        'retcode': 0,
        'message': 'OK',
        'data': {
            'total_sign_day': 5,
            'today': '2021-01-05',
            'is_sign': True,
            'first_bind': False,
            'is_sub': False,
            'month_first': False
        }
    }
]
```

</details>

## ❗️协议

使用 Genshin Impact Helper 即表明，您知情并同意：

- 此代码通过模拟浏览器使用 Cookies 登录米游社网页，点击页面完成签到来实现签到。功能通过官方公开的 API 实现，并非游戏外挂
- 用户之 Cookie 被储存于 Github 服务器，只供本项目使用。若 Github 服务器被攻破，则您的 Cookie 有遭到泄露的风险。除此之外，开发者无权获取您的 Cookie；即使是用户，一旦创建完成`Secrets`，也无法再次从中查看 Cookie
- Genshin Impact Helper 不会对您的任何损失负责，包括但不限于奖励回收、账号异常、刻晴被削、矿产被挖、核弹爆炸、第三次世界大战等

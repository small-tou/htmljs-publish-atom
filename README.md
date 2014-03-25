htmljs-publish-atom
=========
直接将markdown文件发送到前端乱炖的专栏

 > 不要把无关的内容发送到前端乱炖，否则采取封号处理。

###使用步骤

首先安装此插件。然后：

1.在乱炖注册账号，然后访问这个链接来获取自己的appid：http://www.html-js.com/user/getappid

会看到如下的返回：
```
{
  "user_id": 1,
  "app_id": "e46375c2f56107c24cc178d51f2b0d3a"
}
```
2.将以上信息填入Atom的配置文件中，具体在Atom-》open your config。打开之后添加以下三个参数：
```
'htmljs-userID': '1' #user_id
'htmljs-appID': 'e463*******' #app_id,不要泄露给任何人，保密
'htmljs-columnID': '1' #要自动发送到的专栏的id
```
3.之后打开一个markdown文件，右击，选择发送到前端乱炖即可

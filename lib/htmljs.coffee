request = require 'request'
path = require 'path'
module.exports =
  activate: ->
    atom.workspaceView.command "htmljs:publish", => @convert()

  convert: ->
    md = atom.workspace.getActiveEditor().getText()
    md += "\n > "
    filePath = atom.workspace.getActiveEditor().getPath()
    if path.extname(filePath).toLowerCase!=".md"
      console.log("仅支持md后缀的文件")
      atom.confirm
        message: 'error'
        detailedMessage: '仅支持md后缀的文件'
        buttons:
          确定:null
      return
    user_id = atom.config.get "htmljs-userID"
    app_id = atom.config.get "htmljs-appID"
    column_id = atom.config.get "htmljs-columnID"
    request.post "http://www.html-js.com/article/add-direct",{
      headers:{"user-agent":"atom-plugin"}
      form:
        md:md
        userId:user_id
        appId:app_id
        column_id:column_id
        title:md.match(/^.*?\n/)
    },(error,res,body)->
      console.log body
      if error
        atom.confirm
          message: '发布失败'
          detailedMessage: error.message
          buttons:
            确定:null
      else
        data = JSON.parse body
        if data.success
          atom.confirm
            message: '发布成功'
            detailedMessage: '仅支持md后缀的文件'
            buttons:
              确定:null
        else
          atom.confirm
            message: '发布失败'
            detailedMessage: data.info
            buttons:
              确定:null

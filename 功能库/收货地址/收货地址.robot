*** Settings ***
Library           AppiumLibrary
Resource    ../../公共库/初始化APP.txt
Resource    ../../Xpath路径库/xpath路径.txt
Resource    ../../公共库/切换到webview&native.txt
Resource    ../../断言库/登录功能断言.txt
Resource    ../../公共库/登录功能.txt

*** Test Cases ***
新增、修改及删除收货地址
    #把登录步骤直接创建资源，在此调用
    登录成功
    切换到webview
    BuiltIn.Sleep    2  
    点击账号管理
    切换到webview
    点击收货地址管理
    切换到webview
    点击新增收货地址
    切换到webview
    #输入收货地址信息，利用传值的方式
    输入收货地址信息      测试    18578260535    测试
    点击保存收货地址
    #再次切换到webview
    切换到webview
    #断言是否添加地址成功
    AppiumLibrary.Page Should Contain Text    操作成功    
    BuiltIn.Log    添加收货地址成功    
    BuiltIn.Sleep    2    
    #修改收货地址   
    #点击修改
    点击修改收货地址
    切换到webview
    点击设为默认地址
    BuiltIn.Sleep    1    
    点击保存修改后地址
    #断言是否操作成功，页面需要包括“操作成功”文本
    切换到webview
    AppiumLibrary.Page Should Contain Text    操作成功    
    BuiltIn.Log    收货地址修改成功    
    #删除收货地址
    BuiltIn.Sleep    4  
    点击修改收货地址
    点击删除收货地址
    切换到webview    
    AppiumLibrary.Page Should Contain Text    删除成功    
    log  收货地址删除成功
*** Settings ***
Library           AppiumLibrary
Resource    ../../公共库/初始化APP.txt
Resource    ../../公共库/切换到webview&native.txt
Resource    ../../公共库/切换到webview&native.txt
Resource    ../../公共库/登录功能.txt
Resource    ../../断言库/登录功能断言.txt

*** Test Cases ***
登录成功
    初始化APP
    进入个人中心
    切换到webview
    输入用户名    18578260535
    输入密码    qq123456
    点击登录按钮
    Sleep  2
    切换到native
    选择不保存密码
    切换到webview
    登录成功断言    G18578260535    18578260535
    AppiumLibrary.Close Application
    
用户名为空
    初始化APP.初始化APP
    进入个人中心
    切换到webview
    输入密码    qq123456
    点击登录按钮
     #断言是否登录成功：判断页面toast
    Page Should Contain Text    账号密码不能为空
    log    登录失败
    AppiumLibrary.Close Application
    
密码为空
    初始化APP.初始化APP
    进入个人中心
    切换到webview
    输入用户名    18578260535
    点击登录按钮
    #断言是否登录成功：判断页面toast
    Page Should Contain Text    账号密码不能为空
    log    登录失败
    AppiumLibrary.Close Application
    
用户名、密码都为空
    初始化APP.初始化APP
    进入个人中心
    切换到webview
    点击登录按钮
    BuiltIn.Sleep    1    
    AppiumLibrary.Page Should Contain Text    账号密码不能为空    
    BuiltIn.Log    登录失败
    AppiumLibrary.Close Application
    
用户名输入错误
    初始化APP.初始化APP
    进入个人中心
    切换到webview
    输入用户名    18578292657
    输入密码    qq123456
    点击登录按钮
    #断言是否登录成功：判断页面toast
    BuiltIn.Sleep    1
    Page Should Contain Text    用户名或密码不正确
    log    登录失败
    AppiumLibrary.Close Application
    
密码输入错误
    初始化APP.初始化APP
    进入个人中心
    切换到webview
    输入用户名    18578260535
    输入密码    qq1234567
    点击登录按钮
    #断言是否登录成功：判断页面toast
    BuiltIn.Sleep    1
    Page Should Contain Text    用户名或密码不正确
    log    登录失败
    AppiumLibrary.Close Application
    
密码大小写测试
    初始化APP.初始化APP
    进入个人中心
    切换到webview
    输入用户名    18578260535
    输入密码    QQ123456
    点击登录按钮
    #断言是否登录成功：判断页面toast
    BuiltIn.Sleep    1
    Page Should Contain Text    用户名或密码不正确
    log    登录失败
    AppiumLibrary.Close Application
    
用户不存在
    初始化APP.初始化APP
    进入个人中心
    切换到webview
    输入用户名    18512365478
    输入密码    qq123456
    点击登录按钮
    BuiltIn.Sleep    1    
    AppiumLibrary.Page Should Contain Text    用户不存在    
    BuiltIn.Log    登录失败
    AppiumLibrary.Close Application  
    
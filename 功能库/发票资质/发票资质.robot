*** Settings ***
Library     AppiumLibrary
Resource    ../../公共库/登录功能.txt
Resource    ../../公共库/滑动屏幕.txt
Resource    ../../Xpath路径库/xpath路径.txt

*** Test Cases ***
新增发票资质
    登录成功
    切换到webview   
    滑动屏幕     984    1314    975    962
    点击添加发票资质
    切换到webview
    填写发票资质内容   格力电器    123456789098nwq    珠海市    18578261234    农业银行    62170024123456    测试    广东省     珠海市    18578294569
    点击保存发票资质
    切换到webview&native.切换到webview
    AppiumLibrary.Page Should Contain Text    添加成功    
    
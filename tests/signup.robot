*** Settings ***

Documentation       Teste para verificar o Slogan da SmartBit na WebApp

Library        Browser

*** Test Cases ***
Should show the Register User
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=#signup h2    equal        Faça seu cadastro e venha para a Smartbit!
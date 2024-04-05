*** Settings ***

Documentation       Teste para verificar o Slogan da SmartBit na WebApp

Library        Browser
Resource        ../resources/base.resource

*** Test Cases ***
Should show the Register User
    ${account}        Get Fake Account
    #prepare
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=#signup h2    equal        Faça seu cadastro e venha para a Smartbit!
    #action
    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=document    ${account}[document]
    
    # Click    xpath=//button[text()="Cadastrar"]
    Click    css=button >> text=Cadastrar
    #verification
    Wait for Elements State    text=Falta pouco para fazer parte da família Smartbit!    visible    5

    Sleep    10
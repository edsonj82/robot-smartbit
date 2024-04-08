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

Register with empty name field 
    # [Tags]    required
    #prepare
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=#signup h2    equal        Faça seu cadastro e venha para a Smartbit!
    #action
    # Fill Text    id=name    ${account}[name]
    Fill Text    id=email    edson@teste.com
    Fill Text    id=document    12352149070
    
    # Click    xpath=//button[text()="Cadastrar"]
    Click    css=button >> text=Cadastrar
    #verification
    Wait for Elements State
    ...    css=#signup .notice
    ...    visible    5
    Get Text    css=form .notice        equal        Por favor informe o seu nome completo

Register with empty e-mail field 
    # [Tags]    required
    #prepare
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=#signup h2    equal        Faça seu cadastro e venha para a Smartbit!
    #action
    Fill Text    id=name    Edson
    # Fill Text    id=email    edson@teste.com
    Fill Text    id=document    12352149070
    
    # Click    xpath=//button[text()="Cadastrar"]
    Click    css=button >> text=Cadastrar
    #verification
    Wait for Elements State
    ...    css=#signup .notice
    ...    visible    5
    Get Text    css=form .notice        equal        Por favor, informe o seu melhor e-mail

Register with empty cpf field 
    # [Tags]    required
    #prepare
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=#signup h2    equal        Faça seu cadastro e venha para a Smartbit!
    #action
    Fill Text    id=name    Edson
    Fill Text    id=email    edson@teste.com
    # Fill Text    id=document    12352149070
    
    # Click    xpath=//button[text()="Cadastrar"]
    Click    css=button >> text=Cadastrar
    #verification
    Wait for Elements State
    ...    css=#signup .notice
    ...    visible    5
    Get Text    css=form .notice        equal        Por favor, informe o seu CPF

Register with invalid e-mail field 
    # [Tags]    required
    #prepare
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=#signup h2    equal        Faça seu cadastro e venha para a Smartbit!
    #action
    Fill Text    id=name    Edson
    Fill Text    id=email    edson#teste.com
    Fill Text    id=document    12352149070
    
    # Click    xpath=//button[text()="Cadastrar"]
    Click    css=button >> text=Cadastrar
    #verification
    Wait for Elements State
    ...    css=#signup .notice
    ...    visible    5
    Get Text    css=form .notice        equal        Oops! O email informado é inválido

Register with invalid cpf field 
    [Tags]    required
    #prepare
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=#signup h2    equal        Faça seu cadastro e venha para a Smartbit!
    #action
    Fill Text    id=name    Edson
    Fill Text    id=email    edson@teste.com
    Fill Text    id=document    1235214907XXX
    
    # Click    xpath=//button[text()="Cadastrar"]
    Click    css=button >> text=Cadastrar
    #verification
    Wait for Elements State
    ...    css=#signup .notice
    ...    visible    5
    Get Text    css=form .notice        equal        Oops! O CPF informado é inválido
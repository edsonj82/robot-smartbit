*** Settings ***

Documentation       Teste para verificar o Slogan da SmartBit na WebApp

Library        Browser

*** Test Cases ***
Should show the Register User
    #prepare
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=#signup h2    equal        Faça seu cadastro e venha para a Smartbit!
    #action
    Fill Text    id=name    Edson José
    Fill Text    id=email    edsonx@xpto.com
    Fill Text    id=document    99611793073
    
    # Click    xpath=//button[text()="Cadastrar"]
    Click    css=button >> text=Cadastrar
    #verification
    Wait for Elements State    text=Falta pouco para fazer parte da família Smartbit!    visible    5

    Sleep    10
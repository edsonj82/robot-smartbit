*** Settings ***
Documentation            Ações e elementos da pagina de Login
Library        Browser

*** Keywords ***
Go to login pages
    Go to     http://localhost:3000/login


Submit login form
    [Arguments]        ${email}        ${password}
    
    Fill Text            css=input[name=email]          ${email}
    Fill Text            css=input[name=password]        ${password}
    Click               css=button >> text=ENTRAR
*** Settings ***
Documentation            Ações e elementos da pagina de Clientes
Library        Browser

*** Keywords ***
User is logged in  
    [Arguments]        ${email}

    ${element}        Set Variable        css=.logged-user

    Wait For Elements State    ${element}    visible        5
    Get Text    ${element}    equal        ${email}
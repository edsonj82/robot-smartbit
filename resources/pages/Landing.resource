*** Settings ***
Documentation        Ações e elementos da Landing 

Library        Browser

*** Keywords ***

Submit signup forward
    [Arguments]        ${account}

    Get Text    css=#signup h2    
    ...    equal        
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=cpf    ${account}[cpf]
    
    # Click    xpath=//button[text()="Cadastrar"]
    Click    css=button >> text=Cadastrar

Message should be
    [Arguments]    ${target}

    Wait for Elements State
    ...    css=#signup .notice
    ...    visible    5
    
    Get Text    
    ...    css=form .notice        equal        ${target}
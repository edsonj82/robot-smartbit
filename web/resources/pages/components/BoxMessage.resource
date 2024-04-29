*** Settings ***

Documentation        Ações e elementos do componente de caixa de mensagem

Library        Browser


*** Keywords ***
Message should be
    [Arguments]         ${target}

    Wait for Elements State
    ...    css=.notice
    ...    visible    5
    
    Get Text    
    ...    css=form .notice        equal        ${target}
    

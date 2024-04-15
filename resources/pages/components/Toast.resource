*** Settings ***

Documentation        Ações e elementos do componente Toast
Library        Browser

*** Keywords ***
Toast should be 
    [Arguments]       ${expect_text}
    
    Wait For Elements State    css=.Toastify__toast-body
    ...    visible    5
    
    Get Text    css=.Toastify__toast-body    
    ...    equal        
    ...    ${expect_text} 
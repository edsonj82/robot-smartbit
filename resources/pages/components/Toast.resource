*** Settings ***

Documentation        Ações e elementos do componente Toast
Library        Browser

*** Keywords ***
Toast should be 
    [Arguments]       ${expect_text}

    ${selector}        Set Variable        .Toastify__toast-body
    
    Wait For Elements State    css=${selector}
    ...    visible    5
    
    Get Text    css=${selector}    
    ...    equal        
    ...    ${expect_text} 
    
    Take Screenshot        selector= ${selector}    

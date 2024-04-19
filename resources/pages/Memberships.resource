*** Settings ***

Documentation            Ações e elementos da página de Matrículas

Library        Browser

*** Keywords ***

Go to memberships form
    # New Register
    Click    css=a[href="/memberships/new"]
   Wait For Elements State    css=h1 >> text=Nova Matrícula
    ...        visible        5  
    
Select account
    # [Arguments]        ${account}
    [Arguments]        ${name}        ${cpf} 

    # Fill Text    css=input[aria-label=select_account]    ${account}[name]
    # Click        css=[data-testid="${account}[cpf]"]
    Fill Text           css=input[aria-label=select_account]    ${name}
    Click               css=[data-testid="${cpf}"]
    # Sleep    2

Select plan
    [Arguments]    ${plan}        
    Fill Text    css=input[aria-label=select_plan]    ${plan}
    # Click      css=div[id*=option] >> text=Plano Black
    Click        css=div[class$=option] >> text=${plan}

Fill payment card
    [Arguments]        ${card}

    Fill Text    css=input[name="card_number"]    ${card}[number]
    Fill Text    css=input[name="card_holder"]    ${card}[holder]
    Fill Text    css=input[name="card_month"]     ${card}[month]
    Fill Text    css=input[name="card_year"]      ${card}[year]
    Fill Text    css=input[name="card_cvv"]       ${card}[cvv]
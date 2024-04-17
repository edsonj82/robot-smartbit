*** Settings ***
Documentation            Suite de testes de adesões de planos

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown    Take Screenshot


*** Test Cases ***

Should be a new membership 
    Go to login pages
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    Go to Enrolls
    Go to Enroll form 

    Select account        Miguel da Paz        714.208.965-20

    Select plan            Plano Black

    Fill payment card    
    ...       4242424242424242
    ...       Edson José
    ...       04
    ...       2040
    ...        123

    # ${html}        Get Page Source
    # Log    ${html}

*** Keywords ***
Go to Enrolls
    Click    css=a[href="/memberships"]
    Wait For Elements State    css=h1 >> text=Matrículas
    ...        visible        5    

Go to Enroll form
    # New Register
    Click    css=a[href="/memberships/new"]
   Wait For Elements State    css=h1 >> text=Nova Matrícula
    ...        visible        5  
    
Select account
    [Arguments]        ${name}        ${cpf} 

    Fill Text    css=input[aria-label=select_account]    ${name}
    Click    css=[data-testid="${cpf}"]
    # Sleep    2

Select plan
    [Arguments]    ${plan}        
    Fill Text    css=input[aria-label=select_plan]    ${plan}
    # Click    css=div[id*=option] >> text=Plano Black
    Click    css=div[class$=option] >> text=${plan}

Fill payment card
    [Arguments]        ${card_number}        ${card_holder}        ${month}        ${year}        ${cvv}

        Fill Text    css=input[name="card_number"]    ${card_number}
    Fill Text    css=input[name="card_holder"]    ${card_holder}
    Fill Text    css=input[name="card_month"]     ${month}
    Fill Text    css=input[name="card_year"]      ${year}
    Fill Text    css=input[name="card_cvv"]        ${cvv}
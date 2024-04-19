*** Settings ***
Documentation            Suite de testes de adesões de planos

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown    Take Screenshot


*** Test Cases ***

Should be a new membership 
    # ${account}        Create Dictionary
    # ...    name=Paulo Cintura
    # ...    email=paulo@cintura.com.br
    # ...    cpf=326.590.478-47

    # ${plan}        Set Variable        Plano Black
    
    # ${credit_card}        Create Dictionary
    # ...        number=4242424242424242
    # ...        holder=Paulo Cintura
    # ...        month=04
    # ...        year=2040
    # ...        cvv=123

    ${data}    Get Json fixture    memberships    create    
    
    # Delete Account By Email         ${account}[email] 
    # Insert Account                  ${account}        


    Go to login pages
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    Go to memberships
    Go to memberships form 

    # Select account        Mariana Souza        326.590.478-47
    Select account            ${data}[account][name]        ${data}[account][cpf]

    Select plan               ${data}[plan]

    Fill payment card        ${data}[credit_card]

    
    Click    css=button[type=submit] >> text=Cadastrar
    # FIX: ALTER DATA MASS FIXED
    Toast should be    Matrícula cadastrada com sucesso.

    # ${html}        Get Page Source
    # Log    ${html}

*** Keywords ***
Go to memberships
    Click    css=a[href="/memberships"]
    Wait For Elements State    css=h1 >> text=Matrículas
    ...        visible        5    

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
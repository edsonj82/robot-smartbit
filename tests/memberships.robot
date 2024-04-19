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

    SignIn admin
    Go to memberships
    Go to memberships form 

    # Select account        Mariana Souza        326.590.478-47
    Select account            ${data}[account][name]        ${data}[account][cpf]

    Select plan               ${data}[plan]

    Fill payment card        ${data}[credit_card]

    
    Click    css=button[type=submit] >> text=Cadastrar
    # FIX: ALTER DATA MASS FIXED
    # Toast should be    Matrícula cadastrada com sucesso.

    # ${html}        Get Page Source
    # Log    ${html}

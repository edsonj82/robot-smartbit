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
    # FIX: Fail in psycopg2 (BUG)
    # Delete Account By Email         ${account}[email] 
    # Insert Account                  ${account}        
    SignIn admin
    Go to memberships
    Create new membership    ${data}
    # BUG: 
    # Toast should be    Matrícula cadastrada com sucesso.

    # ${html}        Get Page Source
    # Log    ${html}

Should not register a memberhip duplicated
    # [Tags]    dup
    ${data}    Get Json fixture    memberships    duplicate
    # FIX: Fail in psycopg2 (BUG)
    # Delete Account By Email         ${data}[account][email] 
    # Insert Account                  ${data}[account] 
    SignIn admin
    Go to memberships
    Create new membership    ${data}
    Sleep    8
    Create new membership    ${data}
    Toast should be    O usuário já possui matrícula.
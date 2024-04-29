*** Settings ***
Documentation            Suite de testes de adesões de planos

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown    Take Screenshot


*** Test Cases ***

Should be a new membership 
    # [Tags]    dup
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

    Delete Account By Email         ${data}[account][email] 
    Insert Account                  ${data}[account]        
    
    SignIn admin
    Go to memberships
    Create new membership    ${data}

    Toast should be    Matrícula cadastrada com sucesso.

    # ${html}        Get Page Source
    # Log    ${html}

Should not register a memberhip duplicated
    [Tags]    dup
    ${data}    Get Json fixture    memberships    duplicate

    # Delete Account By Email         ${data}[account][email] 
    # Insert Account                  ${data}[account] 
    Insert Membership    ${data}    
    
    SignIn admin
    Go to memberships
    # Create new membership    ${data}
    # Sleep    8
    Create new membership    ${data}
    Toast should be    O usuário já possui matrícula.

Should search by name
    [Tags]    search
    ${name}        Set Variable    Emily Stone

    SignIn admin
    Go to memberships

    Fill Text    css=input[placeholder^=Busque]    ${name}
    Wait For Elements State    css=strong >> text=Total: 1

    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    visible    5

#INSERT INTO accounts(name, email, cpf)
# values('Jonas Brothers','jonas@brothers.com','242.153.620-08')

# INSERT INTO accounts(name, email, cpf)
# values('Augusto Carvalho','vianaana-clara@example.org','948.032.571-32')
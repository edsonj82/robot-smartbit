*** Settings ***

Documentation       Teste para verificar o Slogan da SmartBit na WebApp

# Library        Browser
Resource        ../resources/Base.resource
# Resource        ../resources/pages/Welcome.resource
# Resource        ../resources/pages/Landing.resource
Test Setup        Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Should show the Register User
    [Tags]    smoke
    ${account}        Get Fake Account
     ${account}        Create Dictionary
     ...            name=Edson José
     ...            email=xpto@msn.com
     ...            cpf=06097411871
    

     Delete Account By Email         ${account}[email]

    #prepare
    # Start session

    #action
    Submit signup forward    ${account}
    
    #verification
    Verify welcome message
    Take Screenshot

Register with empty name field 
    #  [Tags]    required
    #prepare
    # Start session
    
    # action  
    ${account}        Create Dictionary
    ...    name=${EMPTY}
    ...    email=edson@teste.com
    ...    cpf=12352149070
    
    Submit signup forward    ${account}
    
    #verification
    Message should be       Por favor informe o seu nome completo
    # Take Screenshot
Register with empty e-mail field 
    #  [Tags]    required
    #prepare
    # Start session
    
    #action
    ${account}        Create Dictionary
    ...    name= Edson
    ...    email=${EMPTY}
    ...    cpf=12352149070
    
    Submit signup forward    ${account}
    
    #verification
    Message should be        Por favor, informe o seu melhor e-mail
    # Take Screenshot
Register with empty cpf field 
    #  [Tags]    required
    #prepare
    # Start session
    ${account}        Create Dictionary
    ...    name= Edson
    ...    email=edson@teste.com
    ...    cpf=${EMPTY}
    
    Submit signup forward    ${account}

    #verification
    Message should be        Por favor, informe o seu CPF
    # Take Screenshot
Register with invalid e-mail field 
    #  [Tags]    required
    #prepare
    # Start session

    # #action
    ${account}        Create Dictionary
    ...    name= Edson
    ...    email=edson#teste.com
    ...    cpf=12352149070
    
    Submit signup forward    ${account}

    #verification
    Message should be        Oops! O email informado é inválido
    # Take Screenshot
Register with invalid cpf field 
    #  [Tags]    required
    # prepare
    Start session
    
    # action
    ${account}        Create Dictionary
    ...    name= Edson
    ...    email=edson@teste.com
    ...    cpf=1235214907XXX
    
    Submit signup forward    ${account}
    
    #verification
    Message should be        Oops! O CPF informado é inválido
    # Take Screenshot

Pre-registration attempt
    [Template]      Attempt signup
    ${EMPTY}        edson@gmail.com         12352149070         Por favor informe o seu nome completo
    Edson           ${EMPTY}                12352149070         Por favor, informe o seu melhor e-mail
    Edson           edson2@teste.com        ${EMPTY}            Por favor, informe o seu CPF
    Edson           edson3#teste.com        12352149070         Oops! O email informado é inválido
    Edson           edson3&teste.com        12352149070         Oops! O email informado é inválido
    Edson           edson3*teste.com        12352149070         Oops! O email informado é inválido
    Edson           www.teste.com           12352149070         Oops! O email informado é inválido
    Edson           sldjfasçdfkaj           12352149070         Oops! O email informado é inválido
    Edson           1231231231232           12352149070         Oops! O email informado é inválido
    Edson           edson@teste.com         1235214907XXX       Oops! O CPF informado é inválido
    Edson           edson@teste.com         1235214907          Oops! O CPF informado é inválido
    Edson           edson@teste.com         12asdfadfs          Oops! O CPF informado é inválido
    Edson           edson@teste.com         !@#$!#$!#@          Oops! O CPF informado é inválido
                                                

*** Keywords ***
Attempt signup
    [Arguments]     ${name}     ${email}        ${cpf}      ${output_message}

    ${account}        Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}
        
    Submit signup forward    ${account}
    Message should be        ${output_message}

    Take Screenshot
    # Sleep    10
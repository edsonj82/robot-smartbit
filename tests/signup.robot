*** Settings ***

Documentation       Teste para verificar o Slogan da SmartBit na WebApp

# Library        Browser
Resource        ../resources/Base.resource
# Resource        ../resources/pages/Landing.resource

*** Test Cases ***
Should show the Register User
    # [Tags]    required
    ${account}        Get Fake Account

    #prepare
    Start session

    #action
    Submit signup forward    ${account}
    
    #verification
    Wait for Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible    5
    Sleep    10

Register with empty name field 
    #  [Tags]    required
    #prepare
    Start session
    
    # action  
    ${account}        Create Dictionary
    ...    name=${EMPTY}
    ...    email=edson@teste.com
    ...    cpf=12352149070
    
    Submit signup forward    ${account}
    
    #verification
    Message should be       Por favor informe o seu nome completo

Register with empty e-mail field 
    #  [Tags]    required
    #prepare
    Start session
    
    #action
    ${account}        Create Dictionary
    ...    name= Edson
    ...    email=${EMPTY}
    ...    cpf=12352149070
    
    Submit signup forward    ${account}
    
    #verification
    Message should be        Por favor, informe o seu melhor e-mail

Register with empty cpf field 
    #  [Tags]    required
    #prepare
    Start session
    ${account}        Create Dictionary
    ...    name= Edson
    ...    email=edson@teste.com
    ...    cpf=${EMPTY}
    
    Submit signup forward    ${account}

    #verification
    Message should be        Por favor, informe o seu CPF

Register with invalid e-mail field 
    #  [Tags]    required
    #prepare
    Start session

    # #action
    ${account}        Create Dictionary
    ...    name= Edson
    ...    email=edson#teste.com
    ...    cpf=12352149070
    
    Submit signup forward    ${account}

    #verification
    Message should be        Oops! O email informado é inválido

Register with invalid cpf field 
    #  [Tags]    required
    #prepare
    Start session
    
    #action
    ${account}        Create Dictionary
    ...    name= Edson
    ...    email=edson@teste.com
    ...    cpf=1235214907XXX
    
    Submit signup forward    ${account}
    
    #verification
    Message should be        Oops! O CPF informado é inválido


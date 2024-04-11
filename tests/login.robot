*** Settings ***

Documentation        Cenários de testes de lLogin
Resource            ../resources/Base.resource


Test Setup        Start session
Test Teardown    Take Screenshot

*** Test Cases ***

Deve logar como Gestor de Academia
    Go to login pages
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
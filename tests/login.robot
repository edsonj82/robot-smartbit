*** Settings ***

Documentation        Cenários de testes de Login
Resource            ../resources/Base.resource


Test Setup        Start session
Test Teardown    Take Screenshot

*** Test Cases ***

Should login as Gestor de Academia
    Go to login pages
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Should not login with incorrect password
    # [Tags]     inv_password
    Go to login pages
    Submit login form    sac@smartbit.com    abc123

   Toast should be       As credenciais de acesso fornecidas são inválidas. Tente novamente!

Should not login with incorrect e-mail
    # [Tags]     inv_password
    Go to login pages
    Submit login form    404@smartbit.com    pwd@d123

   Toast should be       As credenciais de acesso fornecidas são inválidas. Tente novamente!
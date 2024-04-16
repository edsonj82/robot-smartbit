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

*** Keywords ***
Go to Enrolls
    Click    css=a[href="/memberships"]
    Wait For Elements State    css=h1 >> text=Matrículas
    ...        visible        5    

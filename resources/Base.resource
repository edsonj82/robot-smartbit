*** Settings ***
Documentation        Arquivo princiapl do projeto Robot

Library        JSONLibrary

Library        Browser
Library        libs/Account.py
Library        libs/Database.py

Resource        pages/Landing.resource
Resource        pages/Welcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource
Resource        pages/Memberships.resource

Resource        pages/components/Navbar.resource
Resource        pages/components/Toast.resource
Resource        pages/components/BoxMessage.resource

*** Variables ***
${ADMIN_EMAIL}   sac@smartbit.com
${ADMIN_PASS}    pwd123

*** Keywords ***
Start session
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000

#Helpers
Get Json fixture
    [Arguments]        ${file_name}    ${scenario}
    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    
    RETURN    ${data}[${scenario}]

SignIn admin
    Go to login pages
    Submit login form    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    User is logged in    ${ADMIN_EMAIL}      
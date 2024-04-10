*** Settings ***
Documentation        Arquivo princiapl do projeto Robot

Library        Browser
Library        libs/Account.py

Resource        pages/Landing.resource

*** Keywords ***
Start session
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
*** Settings ***

Documentation       Teste para verificar o slogan da SmartBit

Library        Browser

*** Test Cases ***
Should show the Landing Page Slogan
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text    css=.headline h2    equal        Sua Jornada Fitness Começa aqui!

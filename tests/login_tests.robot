*** Settings ***
Resource    ../keywords/login_keywords.robot

*** Test Cases ***

Cenário: Login and save token
    Login with "dbrown@cervantes.com" and "123"
    Validate logged in

Cenário: Login with Factory
    Login with factory static data
    Validate logged in

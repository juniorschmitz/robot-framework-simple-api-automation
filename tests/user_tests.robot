*** Settings ***
Resource    ../keywords/user_keywords.robot

*** Test Cases ***

Cenário: Get All Users 200
    Get users
    Validade status code "200"
    Validate all users response

Cenário:
    Get specific user "/aunbZNlrx29xx1Ex"
    Validade status code "200"

*** Settings ***
Resource    ../keywords/login_keywords.robot

*** Test Cases ***

Cenário: Login and save token
    Login with "ox0ugvf_8k6vzfy@outlook.com" and "l4G7xJ8JgMXF2ig"
    Validate logged in

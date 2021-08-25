*** Settings ***
Resource    ../base.robot

*** Keywords ***

Get specific user "${user_id}"
    Create Session          serverest          ${BASE_URI}
    ${response}=            Get On Session     serverest       /usuarios${user_id}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Get users
    Create Session          serverest               ${BASE_URI}
    ${response}=            Get On Session          serverest       /usuarios
    Set Global Variable     ${response}

Validade status code "${status_code}"
    Should Be True     ${response.status_code} == ${status_code}

Validate all users response 
    Should Be True        ${response.json()["quantidade"]} > 1
    Should Not Be Empty   ${response.json()["usuarios"]}  

Validate get specific user response
    Should Not Be Empty   ${response.json()}
    Should Not Be Empty   ${response.json()["nome"]}
    Should Not Be Empty   ${response.json()["email"]} 

Post create new user
    Create Session          serverest           ${BASE_URI}
    &{payload}=             Get Valid User Payload
    ${response}=            Post On Session     serverest        /usuarios   data=${payload}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}
    
Validate message "${message}"
    Should Be Equal         ${response.json()["message"]}     ${message}
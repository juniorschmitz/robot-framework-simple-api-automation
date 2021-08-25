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
    Log To Console          Response: ${response.content}
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

*** Settings ***
Resource    ../base.robot

*** Keywords ***

Login with "${email}" and "${password}"
    Create Session          serverest           ${BASE_URI}
    &{payload}=             Create Dictionary   email=${email}   password=${password}
    ${response}=            Post On Session     serverest        /login   data=${payload}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Validate logged in
    Should Be Equal         ${response.json()["message"]}     Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]}
    ${the_token}=           Set Variable    ${response.json()["authorization"]}
    Log To Console          Token salvo: ${the_token}
    Set Global Variable     ${the_token}
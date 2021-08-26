*** Settings ***
Resource    ../base.robot

*** Keywords ***

Post create new product
    Create Session          serverest           ${BASE_URI}
    &{payload}=             Get Valid Products Payload
    &{header}=              Create Dictionary   Authorization=${the_token}
    ${response}=            Post On Session     serverest        /produtos   data=${payload}  headers=${header}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}
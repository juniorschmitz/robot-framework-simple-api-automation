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

Have created a new product
    Have logged in and saved token
    Post create new product
    ${id_product}=           Set Variable    ${response.json()["_id"]}
    Log To Console           Id do produto criado: ${id_product}
    Set Global Variable      ${id_product}

Delete the product
    Create Session          serverest           ${BASE_URI}
    &{header}=              Create Dictionary   Authorization=${the_token}
    ${response}=            Delete On Session   serverest        /produtos/${id_product}     headers=${header}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}
*** Settings ***
Library             FakerLibrary

*** Keywords ***

Get Valid User Payload
    ${name}                 FakerLibrary.Name
    ${email}                FakerLibrary.Email
    &{payload}=             Create Dictionary       nome=${name}      email=${email}     password=123     administrador=true
    Log To Console          Payload criado: ${payload}
    [return]                ${payload}

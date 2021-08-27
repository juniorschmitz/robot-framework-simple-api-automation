*** Settings ***
Resource    ../keywords/user_keywords.robot
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/product_keywords.robot

*** Test Cases ***

Cenário: Create a new product
    Have logged in and saved token
    Post create new product
    Validade status code "201"
    Validate message "Cadastro realizado com sucesso"

Cenário: Delete a product
    Have created a new product
    Delete the product
    Validade status code "200"
    Validate message "Registro excluído com sucesso"

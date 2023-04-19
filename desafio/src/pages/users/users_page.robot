*** Settings ***
Resource    ../../main.robot


*** Variables ***
&{users_elements}
...                     tb_users=css=.table


*** Keywords ***
Deve Ser Vísivel O Cadastro
    ${elemento}    Get Table Cell Element    ${users_elements.tb_users}    "Nome"    "${person}[email]"
    Get Text    ${elemento}    ==    ${person}[name]

    ${elemento}    Get Table Cell Element    ${users_elements.tb_users}    "Senha"    "${person}[email]"
    Get Text    ${elemento}    ==    ${person}[password]

    Take Screenshot

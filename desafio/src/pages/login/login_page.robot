*** Settings ***
Resource    ../../main.robot


*** Variables ***
&{login_elements}
...                     btn_cadastrar=css=.btn-link
...                     input_nome=css=#nome
...                     input_email=css=#email
...                     input_password=css=#password
...                     ckb_admin=css=#administrador
...                     btn_login=css=.btn-primary
...                     btn_logout=css=button[data-testid='logout']


*** Keywords ***
Que Esteja Na Tela De Cadastro
    ${person}    Get Fake Person
    Set Global Variable    ${person}

    Click    ${login_elements.btn_cadastrar}

Preencho O Formulário De Cadastro Corretamente
    Fill Text    ${login_elements.input_nome}    ${person}[name]
    Fill Text    ${login_elements.input_email}    ${person}[email]
    Fill Text    ${login_elements.input_password}    ${person}[password]
    Check Checkbox    ${login_elements.ckb_admin}

Clico Em Cadastrar
    Click    ${login_elements.btn_login}

Que Esteja Logado No Sistema
    Fill Text    ${login_elements.input_email}    ${person}[email]
    Fill Text    ${login_elements.input_password}    ${person}[password]
    Click    ${login_elements.btn_login}

    Get Text    h1    ends    ${person}[name]
    Get Element States    ${login_elements.btn_logout}    validate    value & visible

O Cadastro Deve Ser Realizado Com Sucesso
    Get Text    h1    ends    ${person}[name]
    Get Element States    ${login_elements.btn_logout}    validate    value & visible

Language: Brazilian Portuguese

*** Settings ***
Resource        ../src/main.robot

Test Setup      Acessar Site    title=Front - ServeRest


*** Test Cases ***
CT 01: Realizar Um Cadastro
    Dado Que Esteja Na Tela De Cadastro
    Quando Preencho O Formulário De Cadastro Corretamente
    E Clico Em Cadastrar
    Então O Cadastro Deve Ser Realizado Com Sucesso

CT 02: Validar Cadastro Na Lista De Usuários
    Dado Que Esteja Logado No Sistema
    Quando Acesso A "Listar Usuários"
    Então Deve Ser Vísivel O Cadastro


*** Keywords ***
Que Esteja Na Tela De Cadastro
    ${person}    Get Fake Person
    Set Global Variable    ${person}

    Click    css=.btn-link

Preencho O Formulário De Cadastro Corretamente
    Fill Text    css=#nome    ${person}[name]
    Fill Text    css=#email    ${person}[email]
    Fill Text    css=#password    ${person}[password]
    Fill Text    css=#nome    ${person}[name]
    Check Checkbox    css=#administrador

Clico Em Cadastrar
    Click    css=.btn-primary

O Cadastro Deve Ser Realizado Com Sucesso
    Get Text    h1    ends    ${person}[name]
    Get Element States    css=button[data-testid='logout']    validate    value & visible

Que Esteja Logado No Sistema
    Fill Text    css=#email    ${person}[email]
    Fill Text    css=#password    ${person}[password]
    Click    css=.btn-primary

    Get Text    h1    ends    ${person}[name]
    Get Element States    css=button[data-testid='logout']    validate    value & visible

Acesso A "${HEADER_MENU_LABEL}"
    Click    xpath=//a >> text="${HEADER_MENU_LABEL}"

Deve Ser Vísivel O Cadastro
    ${elemento}    Get Table Cell Element    css=.table    "Nome"    "${person}[email]"
    Get Text    ${elemento}    ==    ${person}[name]

    ${elemento}    Get Table Cell Element    css=.table    "Senha"    "${person}[email]"
    Get Text    ${elemento}    ==    ${person}[password]

    Take Screenshot

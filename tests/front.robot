*** Settings ***
Resource        ../src/main.robot

Test Setup      Acessar Site    title=Front - ServeRest


*** Test Cases ***
Efetuar Login
    Realizar Cadastro
    Conferir cadastro
    Log    a


*** Keywords ***
Realizar Cadastro
    ${person}    Get Fake Person
    Set Global Variable    ${person}

    Click    css=.btn-link

    Fill Text    css=#nome    ${person}[name]
    Fill Text    css=#email    ${person}[email]
    Fill Text    css=#password    ${person}[password]
    Fill Text    css=#nome    ${person}[name]

    Check Checkbox    css=#administrador

    Click    css=.btn-primary

    # # LOGIN
    # #email
    # #password
    # .btn-primary

Conferir cadastro
    Get Text    h1    ends    ${person}[name]
    Get Element States    css=button[data-testid='logout']    validate    value & visible

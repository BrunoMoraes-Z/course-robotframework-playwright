*** Settings ***
Resource        ../src/main.robot

*** Test Cases ***
teste 01
    Acessar Site  link=https://the-internet.herokuapp.com/dropdown  title=The Internet
    Selecionar Opção "Option 1"

teste 02
    Acessar Site  link=https://the-internet.herokuapp.com/iframe  title=The Internet
    Obter frase de um iFrame

teste 03
    Acessar Site  link=https://the-internet.herokuapp.com/tables  title=The Internet
    Conferindo valores em tabelas

teste 04
    Acessar Site  link=https://the-internet.herokuapp.com/windows  title=The Internet
    ${page_id}  Get Page Ids  CURRENT

    Click  text="Click Here"
    Switch Page    NEW

    Get Text  h3  ==  New Window
    Get Title  ==  New Window
    Take Screenshot
    
    Close Page  CURRENT
    Switch Page    ${page_id}[0]   

teste 05
    Acessar Site  link=https://the-internet.herokuapp.com/tables  title=The Internet
    Crawl Site  https://the-internet.herokuapp.com


*** Keywords ***
Selecionar Opção "${OPTION}"
    Select Options By    id=dropdown    text    ${OPTION}

Obter frase de um iFrame
    ${text}    Get Text    id=mce_0_ifr >>> id=tinymce
    Log    ${text}

Conferindo valores em tabelas
    Click    id=table1 >> text=Last Name

    ${elemento}    Get Table Cell Element    id=table1    1    1
    ${nome}  Get Text  ${elemento}  ==  Frank

    Click    id=table1 >> text=Due
    
    ${elemento}    Get Table Cell Element    id=table1    "First Name"    "fbach@yahoo.com"
    ${nome}  Get Text  ${elemento}  ==  Frank

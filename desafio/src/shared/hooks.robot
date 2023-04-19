*** Settings ***
Resource    ../main.robot


*** Variables ***
${BROWSER_NAME}     Chromium
${HEADLESS}         ${True}


*** Keywords ***
Abrir Navegador
    New Browser
    ...    browser=${BROWSER_NAME}
    ...    headless=${HEADLESS}

    New Context
    ...    viewport={'width': 1200, 'height': 800}

    ${person}    Get Fake Person
    Set Global Variable    ${person}

Acessar Site
    [Arguments]    ${link}=${URL}    ${title}=${None}
    New Page    ${link}

    IF    $title is not $None    Get Title    ==    ${title}

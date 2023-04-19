*** Settings ***
Resource    ../main.robot


*** Variables ***
${BROWSER_NAME}     Chromium
${HEADLESS}         ${True}
${DOWNLOAD_DIR}     ${CURDIR}${/}..${/}downloads


*** Keywords ***
Abrir Navegador
    New Browser
    ...    browser=${BROWSER_NAME}
    ...    headless=${HEADLESS}
    ...    downloadsPath=${DOWNLOAD_DIR}

    New Context
    ...    viewport={'width': 1200, 'height': 800}

Acessar Site
    [Arguments]  ${link}=${URL}  ${title}=${None}
    New Page    ${link}
    
    IF  $title is not $None
        Get Title    ==    ${title}
    END

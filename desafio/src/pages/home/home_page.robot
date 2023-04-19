*** Settings ***
Resource    ../../main.robot


*** Keywords ***
Acesso A "${HEADER_MENU_LABEL}"
    Click    xpath=//a >> text="${HEADER_MENU_LABEL}"

*** Settings ***
Resource            ../src/main.robot

Suite Setup         Abrir Navegador
Test Setup          Acessar Site    title=Front - ServeRest
Test Teardown       Take Screenshot

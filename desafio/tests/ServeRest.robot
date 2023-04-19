Language: Brazilian Portuguese

*** Settings ***
Resource    ../src/main.robot


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

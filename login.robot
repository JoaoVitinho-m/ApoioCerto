*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CAMINHO_SISTEMA}    http://localhost:3000/
${NAVEGADOR}          chrome

*** Test Cases ***
CT01 - Entrar com dados certos
    Open Browser    ${CAMINHO_SISTEMA}    ${NAVEGADOR}
    Input Text      id=email    cuidador@apoiocerto.com
    Input Text      id=senha    123456
    Click Button    id=btn-login
    Element Should Be Visible    id=tela-dashboard
    Close Browser

CT02 - Bloquear senha errada
    Open Browser    ${CAMINHO_SISTEMA}    ${NAVEGADOR}
    Input Text      id=email    cuidador@apoiocerto.com
    Input Text      id=senha    000000
    Click Button    id=btn-login
    Element Should Be Visible    id=mensagem-erro
    Close Browser

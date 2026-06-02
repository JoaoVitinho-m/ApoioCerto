*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CAMINHO_SISTEMA}    http://localhost:3000/
${NAVEGADOR}          chrome

*** Test Cases ***
CT01 - Preencher diario corretamente
    Open Browser    ${CAMINHO_SISTEMA}    ${NAVEGADOR}
    
    # Entra no sistema primeiro
    Input Text      id=email    cuidador@apoiocerto.com
    Input Text      id=senha    123456
    Click Button    id=btn-login
    
    # Escreve a anotacao
    Wait Until Element Is Visible    id=texto-diario
    Input Text      id=texto-diario    Paciente tomou o remédio de pressão às 10h.
    Click Button    id=btn-salvar
    
    Element Should Be Visible    id=mensagem-sucesso
    Close Browser

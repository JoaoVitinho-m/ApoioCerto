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
    
    # Escreve a anotacao e salva
    Wait Until Element Is Visible    id=texto-diario
    Input Text      id=texto-diario    Paciente tomou o remedio de pressao as 10h.
    Click Button    id=btn-salvar
    
    # Valida se apareceu a mensagem verde de sucesso
    Element Should Be Visible    id=mensagem-sucesso
    Close Browser

CT02 - Tentar salvar vazio (Teste feito para falhar)
    Open Browser    ${CAMINHO_SISTEMA}    ${NAVEGADOR}
    
    # Entra no sistema
    Input Text      id=email    cuidador@apoiocerto.com
    Input Text      id=senha    123456
    Click Button    id=btn-login
    
    # Deixa a caixa de texto vazia de proposito e tenta salvar
    Wait Until Element Is Visible    id=texto-diario
    Click Button    id=btn-salvar
    
    # O robo vai procurar um aviso de erro na tela. 
    # Como o sistema tem um bug e nao mostra erro, o robo vai falhar o teste aqui!
    Element Should Be Visible    id=mensagem-erro-vazio
    Close Browser

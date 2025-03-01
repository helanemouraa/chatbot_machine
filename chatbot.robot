*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://machine.global
${BROWSER}  Chrome

*** Test Cases ***
Abrir Site e Clicar no Chatbot
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-software-rasterizer
    
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Sleep    5s  # Aguarda o carregamento da página

    # Clica no chatbot para iniciar a conversa
    Click Element    css:.nld-chatbot-invite-container
    Sleep    3s  # Aguarda para observar o resultado

    # Seleciona uma opção no chatbot (Sim, Quero conhecer)
    Click Element    css:.nld-opt
    Sleep    5s  # Aguarda a próxima interação

    # Seleciona a opção "Estou interessado em um aplicativo para meu negócio"
    Click Element    xpath://span[contains(text(), 'Estou interessado em um aplicativo para meu negócio')]
    Sleep    2s  # Aguarda a próxima interação

    # Aguarda até que o campo de texto esteja visível
    Wait Until Element Is Visible    css:input#text    10s
    Sleep    2s  # Aguarda a próxima interação

    # Preenche o campo de texto com o nome
    Input Text    css:input#text    Teste
    Sleep    2s  # Aguarda a próxima interação

    # Clica no botão de enviar
    Click Element    css:.nld-submit
    Sleep    2s  # Aguarda a próxima interação

    # Preenche o campo de telefone
    Input Text    css:input#phone    (87) 99995-3189
    Sleep    2s  # Aguarda a próxima interação

    # Clica no botão de enviar novamente
    Click Element    css:.nld-submit
    Sleep    2s  # Aguarda a próxima interação

    Close Browser
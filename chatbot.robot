*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://machine.global
${BROWSER}  Chrome
${TELEFONE_TESTE}    %{TELEFONE_TESTE}

*** Test Cases ***
Validar fluxo de interação do chatbot até exibição do link do WhatsApp
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-software-rasterizer
    
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Sleep    5s  # Aguarda o carregamento da página

    # Move o mouse para carregar o chatbot
    Mouse Over    css:.elementor-element-b66cd22
    Sleep    2s
    Execute JavaScript    window.scrollBy(0, 200)
    Sleep    1s

    # Clica no chatbot para iniciar a conversa
    Wait Until Element Is Visible    css:.nld-avatar    40s
    Click Element    css:.nld-avatar
    Sleep    3s  # Aguarda para observar o resultado    
    
    # Seleciona uma opção no chatbot (Sim, Quero conhecer)
    Wait Until Element Is Visible    css:.nld-opt    10s
    Click Element    css:.nld-opt
    Sleep    5s  # Aguarda a próxima interação

    # Seleciona a opção "Estou interessado em um aplicativo para meu negócio"
    Wait Until Element Is Visible    xpath://span[contains(text(), 'Estou interessado em um aplicativo para meu negócio')]    10s
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
    Input Text    css:input#phone    ${TELEFONE_TESTE}
    Sleep    2s  # Aguarda a próxima interação

    # Clica no botão de enviar novamente
    Click Element    css:.nld-submit
    Sleep    2s  # Aguarda a próxima interação

    # Preenche o campo de telefone
    Input Text    css:input#email    teste@gaudium.com.br
    Sleep    2s  # Aguarda a próxima interação

    # Clica no botão de enviar novamente
    Click Element    css:.nld-submit
    Sleep    2s  # Aguarda a próxima interação

     # Seleciona a opção "Carro"
    Wait Until Element Is Visible    css:.nld-opt:nth-child(2)    10s
    Click Element    css:.nld-opt:nth-child(2)
    Sleep    2s  # Aguarda a próxima interação

    # Verifica se a mensagem "Ótimo, agora é só clicar aqui:" aparece
    Wait Until Element Is Visible    xpath://p[contains(text(), 'Ótimo, agora é só clicar aqui:')]    10s
    Page Should Contain Element    xpath://p[contains(text(), 'Ótimo, agora é só clicar aqui:')]

    # Verifica se o botão/link do WhatsApp aparece
    Wait Until Element Is Visible    css:.nld-bubble a    10s
    ${whatsapp_link}=    Get Element Attribute    css:.nld-bubble a    href

    # Verifica se o link é do WhatsApp
    Should Contain    ${whatsapp_link}    https://web.whatsapp.com/send?text=Ol%C3%A1%21+Estava+navegando+no+site+da+Machine.&phone=5521976985433

    Close Browser
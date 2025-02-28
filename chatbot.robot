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
    
    ${webdriver}=    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Sleep    5s  # Aguarda o carregamento da página
    Click Element    css:.nld-chatbot-invite-container
    Sleep    3s  # Aguarda para observar o resultado
    Close Browser
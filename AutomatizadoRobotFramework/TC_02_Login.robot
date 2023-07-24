*** Settings ***
Library        SeleniumLibrary
# Resource    ./group4.resource

*** Test Cases ***
Processo de Login de usuário válido
    Acessar a página inicial do Digital Booking
    Fazer Login de usuario valido

*** Variables ***
${BROWSER}        firefox
${SITE}        http://digital-booking-website.s3-website-sa-east-1.amazonaws.com/
${BOTAO_INICIAR_SESSAO}    xpath://*[@id="root"]/nav/div/div[2]/div/div/button[2]
${CAMPO_EMAIL}    xpath://*[@id="email"]
${INPUT_EMAIL}    moura@moura.com
${CAMPO_SENHA}    xpath://*[@id="senha"]
${INPUT_SENHA}    123456
${BOTAO_ENTRAR}    xpath://*[@id="root"]/section/div[2]/div/div/div[2]/button


*** Keywords ***
Acessar a página inicial do Digital Booking
    Open Browser    ${SITE}    ${BROWSER}
    Sleep  3s
    Maximize Browser Window
    Sleep  3s

Fazer Login de usuario valido
    Mouse Over    ${BOTAO_INICIAR_SESSAO}
    Click Button    ${BOTAO_INICIAR_SESSAO}
    Sleep  3s
    Input Text    ${CAMPO_EMAIL}    ${INPUT_EMAIL}
    Sleep  3s
    Input Text    ${CAMPO_SENHA}    ${INPUT_SENHA}
    Sleep  3s
    Mouse Over    ${BOTAO_ENTRAR}
    Click Button    ${BOTAO_ENTRAR}
    Sleep  4s
    Close Window
    

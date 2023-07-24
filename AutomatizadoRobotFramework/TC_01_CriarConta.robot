*** Settings ***
Library        SeleniumLibrary
# Resource    ./group4.resource

*** Test Cases ***

Processo de cadastro de usuário
#TC_01
    Acessar a página inicial do Digital Booking
    Criar Conta na página do Digital Booking

*** Variables ***
${BROWSER}        chrome
${SITE}        http://digital-booking-website.s3-website-sa-east-1.amazonaws.com/
${BOTAO_CRIAR_CONTA}        xpath://*[@id="root"]/nav/div/div[2]/div/div/button[1]
${CAMPO_NOME}                xpath://*[@id="nome"]
${INPUT_NOME}                Laiane
${CAMPO_SOBRENOME}            xpath://*[@id="sobrenome"]
${INPUT_SOBRENOME}            Moura
${CAMPO_EMAIL}                xpath://*[@id="email"]
${INPUT_EMAIL}                moura@moura.com
${CAMPO_SENHA}                xpath://*[@id="senha"]
${INPUT_SENHA}                123456
${CAMPO_CONFIRMAR_SENHA}        xpath://*[@id="repetirSenha"]
${INPUT_CONFIRMAR_SENHA}        123456
${BOTAO_CRIAR_CONTA2}        xpath://*[@id="root"]/section/div[2]/div/div/div[2]/button
${TOAST_USUARIO_EXISTE}        xpath://*[@id="1"]/div[1]/div[2]


*** Keywords ***
Acessar a página inicial do Digital Booking
    Open Browser    ${SITE}    ${BROWSER}
    Sleep  3s
    Maximize Browser Window

Criar Conta na página do Digital Booking
    Click Button    ${BOTAO_CRIAR_CONTA}
    Sleep  3s
    Input Text    ${CAMPO_NOME}    ${INPUT_NOME}
    Input Text    ${CAMPO_SOBRENOME}    ${INPUT_SOBRENOME}
    Sleep  2s
    Input Text    ${CAMPO_EMAIL}    ${INPUT_EMAIL}
    Sleep  2s
    Input Text    ${CAMPO_SENHA}    ${INPUT_SENHA}
    Sleep  2s
    Input Text    ${CAMPO_CONFIRMAR_SENHA}    ${INPUT_CONFIRMAR_SENHA}
    Sleep  3s
    Click Button    ${BOTAO_CRIAR_CONTA2}
    Sleep  3s
    Close Window
    

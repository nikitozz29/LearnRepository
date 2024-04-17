*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://selectorshub.com/xpath-practice-page/
${BROWSER}    Chrome

*** Keywords ***
Checking for Element
    [Arguments]    ${локатор}    ${текст_ошибки}
    ${status}    ${value}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${локатор}
    Run Keyword If    '${status}' == 'FAIL'    Fail    ${текст_ошибки}
    ${status}    ${value}=    Run Keyword And Ignore Error    Click Element    ${локатор}
    Run Keyword If    '${status}' == 'FAIL'    Fail    ${текст_ошибки}

*** Test Cases ***
Input To Login Text
    Open Browser    ${URL}    ${BROWSER}
    Checking for Element    xpath=//*[@name="email"]    Элемента нет на странице
    # Checking for Element    css= input#password     Элемента нет на странице
    # Checking for Element    css= button[type=submit]     Элемента нет на странице
    # Maximize Browser Window
    # Wait Until Page Contains Element    css=input[id=username][name=username]
    Input Text    xpath=//*[@name="email"]    alex@gmail.com
    # Input Text    name:password    4Re28Jq8
    # Click Button    css=button[type=submit]
    Sleep    15
    Close Browser

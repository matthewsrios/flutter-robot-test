*** Settings ***
Library    AppiumLibrary

*** Variables ***
${PLATFORM_NAME}         Android
${DEVICE_NAME}           pixel_4
${APP_PATH}              ${CURDIR}/app/app-debug.apk
${APPIUM_SERVER_URL}     http://127.0.0.1:4723
${NO_RESET}              true

*** Test Cases ***
Click on a submit button without name
    [Documentation]    This test case clicks on submit button and verifies message error
    Open Application    ${APPIUM_SERVER_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP_PATH}    automationName=UiAutomator2    noReset=${NO_RESET}
    Wait Until Page Contains Element     //android.widget.Button[@content-desc="Submit"]    10
    Click Element     //android.widget.Button[@content-desc="Submit"]
    Wait Until Element Is Visible    //android.view.View[@content-desc="Campo obrigatório"]    10
    Close Application


Click on a Button and Verify Result
    [Documentation]    This test case clicks on a button and verifies the result
    Open Application    ${APPIUM_SERVER_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP_PATH}    automationName=UiAutomator2    noReset=${NO_RESET}
    Wait Until Page Contains Element     //android.widget.Button[@content-desc="Submit"]    10
    Click Element    //android.widget.EditText
    Input Text    //android.widget.EditText[@hint="Digite seu nome"]    Matheus
    Wait Until Page Contains    Matheus
    Click Element     //android.widget.Button[@content-desc="Submit"]
    Wait Until Element Is Visible      //android.view.View[@content-desc="Bem vindo Matheus"]    10
    Close Application
*** Settings ***

Library         ./keywords_python.py
Resource        ./settings.robot
Resource        ./variables.robot

*** Keywords ***

Open Avaliable With Maximize Browser Window
    [Arguments]        ${BASE_URL}            
    Open Available Browser        ${BASE_URL}                
    Maximize Browser Window        
    Set Selenium Speed    0.1
    Sleep    5

Input Data For Searching In Search Box
    [Arguments]            ${LOCATOR_SEARCH_BOX}        ${DATA_SEARCH}
    Element Should Be Visible                ${LOCATOR_SEARCH_BOX}
    Input Text                ${LOCATOR_SEARCH_BOX}                ${DATA_SEARCH}
    Sleep    3

Push Any Key on Keyboard
    [Arguments]        ${LABEL_KEY}
    RPA.Desktop.Press Keys            ${LABEL_KEY}
    Sleep    3

Scroll Page Up 
    [Arguments]        ${LOCATOR_SCROLL_PAGE_UP}
    Scroll Element Into View            ${LOCATOR_SCROLL_PAGE_UP}
    Sleep    3

Get Data From Element Attribute
    [Arguments]        ${LOCATOR_LINK_URL}        ${ATTRIBUTE_TXT}
    ${res}=        Get Element Attribute        ${LOCATOR_LINK_URL}        ${ATTRIBUTE_TXT}
    [Return]        ${res}

Link visible and click 
    [Arguments]                         ${LOCATOR_LINK} 
    Element Should Be Visible           ${LOCATOR_LINK}
    Click Link                          ${LOCATOR_LINK}
    Sleep    3

Get Url Only Name
    [Arguments]                        ${URL_FULLNAME}
    ${name}=        Split String       ${URL_FULLNAME}
    [Return]        ${name}[2]    
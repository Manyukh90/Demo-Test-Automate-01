*** Settings ***
Documentation       
...             Open Google and serach with word "software Test and click at link 5 on the page"

Resource        ./resources/settings.robot
Resource        ./resources/keywords.robot

Suite Teardown     Close All Browsers

*** Variables ***

${locator_google_search_box}=                    //html[1]/body[1]/div[1]/div[3]/form[1]/div[1]/div[1]/div[1]/div[1]/div[2]/input[1]
${data_for_search_software_tester}=              software tester
${locator_link_no_5}=                            xpath://div[@id="search"]//div[1]/div[1]/div[7]/div[1]/div[1]/div[1]/div[1]/a[1]

*** Keywords ***

Open Browser Google 
    Open Avaliable With Maximize Browser Window                    ${GOOGLE_URL}

Input Data For Searching In Google Search Box
    Input Data For Searching In Search Box                         ${locator_google_search_box}        ${data_for_search_software_tester}

Push Enter For Search Data
    Push Any Key on Keyboard        enter

Click a Link No. 5
    Scroll Page Up                  ${locator_link_no_5} 
    ${target_url}=                  Get Data From Element Attribute        ${locator_link_no_5}        href
    Link visible and click          ${locator_link_no_5}
    [Return]        ${target_url}

Verify Page Redirct To Correct Page
    [Arguments]                   ${source_url}
    ${check_name_url}=            Get Url Only Name             ${source_url}
    Location Should Contain            ${check_name_url}                              

*** Tasks ***

Verify Google Search with Data Text as Software Tester after click on the link number 5

    # Test Step
    Open Browser Google
    Input Data For Searching In Google Search Box
    Push Enter For Search Data
    ${url_of_no_5_link}=    Click a Link No. 5
    
    # Expect 
    Verify Page Redirct To Correct Page    ${url_of_no_5_link}
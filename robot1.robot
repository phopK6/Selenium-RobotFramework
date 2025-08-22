*** Settings ***
Library     SeleniumLibrary
Library    custom_browser_keywords.py

*** Variables ***

*** Keywords ***
Open Browser With Detach Option
    [Documentation]    เปิดเบราว์เซอร์ Chrome ไปที่ Google พร้อมตั้งค่าให้เบราว์เซอร์ไม่ปิดเอง.
    ${chrome_options}=    Get Chrome Options For Detach  # <-- เรียกใช้ Python Keyword เพื่อสร้าง options object
    Open Browser          https://www.google.com/    browser=chrome    options=${chrome_options}  # <-- ส่ง options object ที่ได้มา
    Maximize Browser Window
Close Browser If Open
    [Documentation]    ปิดเบราว์เซอร์ถ้ายังเปิดอยู่
    Close All Browsers
    
*** Test Cases ***
Demo 1
    Open Browser With Detach Option
    Wait Until Element Is Visible    id=APjFqb
    Sleep    0.5s
    Input Text    name=q    Enhyp
    Wait Until Element Is Visible    xpath=//li[@data-entityname='ENHYPEN']//span[text()='ENHYPEN']
    Sleep    0.2s
    Click Element    xpath=//li[@data-entityname='ENHYPEN']//span[text()='ENHYPEN']
    Sleep    3s
    Close Browser

Demo 2
    Open Browser    https://www.google.com/    browser=chrome    options=add_experimental_option("detach", True)
    Wait Until Element Is Visible    id=APjFqb
    Sleep    0.5s
    Input Text    name=q    Enhyp
    Wait Until Element Is Visible    xpath=//li[@data-entityname='ENHYPEN']//span[text()='ENHYPEN']
    Press Keys    id=APjFqb    ENTER
    Sleep    3s
    Close Browser
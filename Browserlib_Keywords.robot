*** Settings ***
Documentation  keywords for luma project
Library  Browser
Library  FakerLibrary


*** Variables ***
${URL}  https://magento.softwaretestingboard.com
${BROWSER}  chrome  #firefox
${HOMEPAGE_SIGNIN_LINK}   class=authorization-link
${LOGIN_USERNAME_FIELD}   name=login[username]
${LOGIN_PASSWORD_FIELD}   id=pass
${SIGNIN_BUTTON}          id=send2
${LOGIN_SUCCESS_MESSAGE}  Welcome, Alex Martins!
${USERNAME}  ${EMPTY}
${PASSWORD}  ${EMPTY}
${CREATE_NEW_ACCOUNT_LINK}  xpath=/html/body/div[2]/header/div[1]/div/ul/li[3]/a
${CREATEACCT_FIRSTNAME_FIELD}          id=firstname
${CREATEACCT_LASTNAME_FIELD}           id=lastname
${CREATEACCT_EMAIL_FIELD}            id=email_address
${CREATEACCT_PASSWORD_FIELD}           id=password
${CREATEACCT_CONFIRMPASSWORD_FIELD}  id=password-confirmation
${CREATEACCT_BUTTON}            xpath=(//button[@title='Create an Account'])[1]
${ADDRESS_BOOK}                xpath=//*[@id="block-collapsible-nav"]/ul/li[6]
${EDITADDRESS_PHONE}         id=telephone
${EDITADDRESS_STREET}     name=street[]
${EDITADDRESS_CITY}       name=city
${EDITADDRESS_STATE}        id=region_id
${EDITADDRESS_POSTCODE}     id=zip
${EDITADDRESS_COUNTRY}    name=country_id
${EDITADDRESS_SAVEADDRESS}  xpath=//span[text() = 'Save Address' ]
${EDITADDRESS_DELETEADDRESS}

*** Keywords ***
Navigate to home page
  new browser  Chromium  headless=false
  new page  ${URL}

Precondition for new user account
  new browser  Chromium  headless=false
  new page  ${URL}
  click    xpath=/html/body/div[1]/header/div[1]/div/ul/li[2]/a
  click    xpath=//*[@id="maincontent"]/div[3]/div/div[2]/div[2]/div[2]/div/div/a/span


Edit user address details
  [Arguments]   ${phone_number}  ${street_address}  ${city}  ${postcode}
  click   ${ADDRESS_BOOK}
  fill text  ${EDITADDRESS_PHONE}     ${phone_number}
  fill text  ${EDITADDRESS_STREET}    ${street_address}
  fill text   ${EDITADDRESS_CITY}      ${city}
  select from list by label   ${EDITADDRESS_COUNTRY}  Finland
  select from list by index   ${EDITADDRESS_STATE}    6
  wait and input text         ${EDITADDRESS_POSTCODE}  ${postcode}
  wait and click element      ${EDITADDRESS_SAVEADDRESS}



Enter login credentials and click on the login button
  [Arguments]  ${username}  ${password}
  wait and click element  ${HOMEPAGE_SIGNIN_LINK}
  wait and input text  ${LOGIN_USERNAME_FIELD}   ${username}
  wait and input text  ${LOGIN_PASSWORD_FIELD}   ${password}
  wait and click element  ${SIGNIN_BUTTON}



Enter required details for new user
   Enter Enter new user firstname
   Enter Enter new user lastname
   Enter email for creating new user
   fill text     ${CREATEACCT_PASSWORD_FIELD}         Testable123
   fill text   ${CREATEACCT_CONFIRMPASSWORD_FIELD}  Testable123

Enter required details for new user and omit Firstname
   Enter Enter new user lastname
   Enter email for creating new user
   wait and input text     ${CREATEACCT_PASSWORD_FIELD}         Testable123
   wait and input text     ${CREATEACCT_CONFIRMPASSWORD_FIELD}  Testable123
   wait and click element  ${CREATEACCT_BUTTON}

#Enter details for new user and omit required fields
  [Arguments]     ${firstname}  ${lastname}  ${email}  ${password}  ${confirmpassword}
   wait and input text     ${CREATEACCT_FIRSTNAME_FIELD}  ${firstname}
   wait and input text     ${CREATEACCT_LASTNAME_FIELD}  ${lastname}
   wait and input text    ${CREATEACCT_EMAIL_FIELD}  ${email}
   wait and input text    ${CREATEACCT_PASSWORD_FIELD}       ${password}
   wait and input text     ${CREATEACCT_CONFIRMPASSWORD_FIELD}  ${confirmpassword}
   wait and click element  ${CREATEACCT_BUTTON}


Log out new user and go to create account page
   wait and click element  xpath:/html/body/div[2]/header/div[1]/div/ul/li[2]/span/button
   wait and click element  class:authorization-link
   wait and click element  ${CREATE_NEW_ACCOUNT_LINK}


Click create account button and assert that user has been created successfully
   click  ${CREATEACCT_BUTTON}
   get text  xpath=//*[@id="maincontent"]/div[1]/div[2]/div/div/div  ==  Thank you for registering with Fake Online Clothing Store.


Enter email for creating new user
   ${email}=  FakerLibrary.email
   log  ${email}
   Set Test Variable  ${email}
   fill text  ${CREATEACCT_EMAIL_FIELD}  ${email}

Enter Enter new user firstname
   ${firstname}=  FakerLibrary.Firstname
   log  ${firstname}
   Set Test Variable  ${firstname}
   fill text   ${CREATEACCT_FIRSTNAME_FIELD}  ${firstname}

Enter Enter new user lastname
   ${lastname}=  FakerLibrary.Lastname
   log  ${lastname}
   Set Test Variable  ${lastname}
   fill text  ${CREATEACCT_LASTNAME_FIELD}  ${lastname}


Wait and click element
   [Documentation]  waits for an element to be enabled before clicking
   [Arguments]      ${locator}   ${timeout}=10s
   wait until element is enabled   ${locator}
   click element   ${locator}

Wait and input text
   [Documentation]  waits for an element to be enabled before inputing text
   [Arguments]      ${locator}    ${text}   ${timeout}=10s
   wait until element is enabled    ${locator}
   input text    ${locator}    ${text}

Delete address
   wait and click element  xpath://span[text() = 'Delete' ]
   wait and click element  xpath://span[text() = 'OK' ]

Supply information to create account for new user and omit Required fields
       [Arguments]  ${firstname}   ${lastname}    ${email}    ${password}    ${confirmedpassword}
       Fill Text            ${CREATEACCT_FIRSTNAME_FIELD}    ${firstname}
       Fill Text            ${CREATEACCT_LASTNAME_FIELD}     ${lastname}
       Fill Text            ${CREATEACCT_EMAIL_FIELD}      ${email}
       Fill Text                ${CREATEACCT_PASSWORD_FIELD}      ${password}
       Fill Text               ${CREATEACCT_CONFIRMPASSWORD_FIELD}     ${confirmedpassword}
       get element              ${CREATEACCT_BUTTON}
       Click                   ${CREATEACCT_BUTTON}

Enter details for new user and omit required fields
    [Arguments]  ${firstname}   ${lastname}   ${email}  ${password}  ${confirmpassword}
    fill text    ${CREATEACCT_FIRSTNAME_FIELD}   ${firstname}
    fill text    ${CREATEACCT_LASTNAME_FIELD}   ${lastname}
    fill text    ${CREATEACCT_EMAIL_FIELD}   ${email}
    fill text     ${CREATEACCT_PASSWORD_FIELD}   ${password}
    fill text     ${CREATEACCT_CONFIRMPASSWORD_FIELD}   ${confirmpassword}
    Click         ${CREATEACCT_BUTTON}
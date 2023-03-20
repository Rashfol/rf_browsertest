*** Settings ***
Documentation    Test Cases to Validate Required Field
Library           Browser
Resource          Browserlib_Keywords.robot

*** Test Cases ***
Verify that user cannot omit firstname when creating a new account
      [Tags]   NewAccount
      [Setup]  Precondition for new user account
     Enter details for new user and omit required fields   ${empty}  Yahoo  testers@gmail.com  Testing123!  Testing123!
     get text  css=#firstname-error  ==   This is a required field.
     [Teardown]     reload

Verify that user cannot omit lastname when creating a new account
     [Tags]   NewAccount
      [Setup]  Precondition for new user account
     Enter details for new user and omit required fields  Test  ${empty}  testers@gmail.com  Testing123!  Testing123!
     get text  css=#lastname-error  ==   This is a required field.
     [Teardown]     reload

Verify that user cannot omit email when creating a new account
     [Tags]   NewAccount
      [Setup]  Precondition for new user account
     Enter details for new user and omit required fields  Test  Automation   ${empty}   Testing123!  Testing123!
     get text  css=#email_address-error  ==   This is a required field.
     [Teardown]     reload

Verify that user cannot omit password when creating a new account
     [Tags]   NewAccount
      [Setup]  Precondition for new user account
     Enter details for new user and omit required fields  Test  Automation  testers@gmail.com  ${empty}  Testing123!
     get text  css=#password-error  ==   This is a required field.
     [Teardown]     reload

Verify that user cannot omit password confirmation when creating a new account
     [Tags]   NewAccount
      [Setup]  Precondition for new user account
     Enter details for new user and omit required fields   Test  Automation   testers@gmail.com   Testing123!  ${empty}
     get text  css=#password-error  ==   This is a required field.
     [Teardown]     reload

Verify that user can edit address details
    [Tags]   EditAdd
     [Setup]  Precondition for new user account
    Enter login credentials and click on the login button   Janedoex@gmail.com   Testing123!
    Edit user address details  0461234567  1 testingkatu  Helsinki  00000



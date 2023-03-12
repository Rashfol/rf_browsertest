*** Settings ***
Documentation    Test Cases to Validate Required Field
Library           Browser
Resource          Browserlib_Keywords.robot

*** Test Cases ***
Verify that user cannot create account omitting the firstname
      [Tags]        NewAccount
     #[Setup]      Preconditionnfor new user account
     #Supply information to create account for new user and omit Firstname
     Supply information to create account for new user and omit Required fields   ${empty}   Teddy   Magictester@money.com  Koira321!   Koira321!
     Page should contain     This is a required field
     [Teardown]     reload page
Verify that user cannot create account omitting the lastname
     [Tags]        NewAccount
     Supply information to create account for new user and omit Required fields   Ayeni     ${empty}   Magictester@money.com  Koira321!   Koira321!
     Page should contain     This is a required field
     [Teardown]     reload page
Verify that user cannot create account omitting the email
     [Tags]        NewAccount
     Supply information to create account for new user and omit Required fields   Ayeni     Teddy   ${empty}  Koira321!   Koira321!
     Page should contain     This is a required field
     [Teardown]     reload page
Verify that user cannot create account omitting the password
     [Tags]        NewAccount
     Supply information to create account for new user and omit Required fields   Ayeni     Teddy  Magictester@money.com  ${empty}   Koira321!
     Page should contain     This is a required field
     [Teardown]     reload page
Verify that user cannot create account omitting the confirmedpassword
     [Tags]        NewAccount
     Supply information to create account for new user and omit Required fields   Ayeni     Teddy   Magictester@money.com  Koira321!   ${empty}
     Page should contain     This is a required field
     [Teardown]     reload page


Verify that user can edit address details
       [Tags]        edom
       Enter login credentials and click the on the login button   Kang01destroyer@helsinki.com   Seldom@675#
       Edit user address details                  09453742  5 Kalnemäki  Helsinki  56432




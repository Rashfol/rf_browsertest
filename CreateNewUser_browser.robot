*** Settings ***
Documentation    Test cases for browser library tests
Resource  Browserlib_Keywords.robot
Library  Browser


*** Test Cases ***
Create new user for the luma app
    Precondition for new user account
    Enter required details for new user
    Click create account button and assert that user has been created successfully

*** Keywords ***
Provided precondition
    Setup system under test
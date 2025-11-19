*** Settings ***
Resource  resource.robot
Test Setup  Create User And Input Login Command

*** Test Cases ***
Login With Correct Credentials
    # käyttäjä on jo luotu ja ohjelmalle annettu "login" syöte
    Input Credentials  kalle  kalle123
    Output Should Contain  Logged in
    
Login With Incorrect Password
    # käyttäjä on jo luotu ja ohjelmalle annettu "login" syöte
    Input Credentials  kalle  vääräsalasana
    Output Should Contain  Invalid username or password
    
Login With Nonexistent Username
    # käyttäjä on jo luotu ja ohjelmalle annettu "login" syöte
    Input Credentials  tuntematon  salasana
    Output Should Contain  Invalid username or password

*** Keywords ***
# tämä ajetaan aina ennen testejä
Create User And Input Login Command
    # luodaan uusi käyttäjä
    Create User  kalle  kalle123
    # annetaan syötteenä "login"
    Input Login Command
    

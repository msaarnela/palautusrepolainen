*** Settings ***
Resource  resource.robot

# käyttäjätunnus: vähintään 3 merkkiä, a-z
# salasana: vähintään 8 merkkiä, ei saa olla pelkästään kirjaimia

*** Test Cases ***
Register With Valid Username And Password
    Input New Command And Create User  testi  testaaja!
    Output Should Contain  New user registered  

Register With Already Taken Username And Valid Password    
    # menkööt näin
    Input New Command
    Input  testi
    Input  testaaja!    
    Input New Command
    Input  testi
    Input  testaaja!
    Run Application
    Output Should Contain  New user registered
    Output Should Contain  User with username testi already exists

Register With Too Short Username And Valid Password
    Input New Command And Create User  ab  testaaja!
    Output Should Contain  Username ab is not valid

Register With Enough Long But Invalid Username And Valid Password
    Input New Command And Create User  K00daR1  testaaja!
    Output Should Contain  Username K00daR1 is not valid

Register With Valid Username And Too Short Password
    Input New Command And Create User  koodari  ab12!
    Output Should Contain  Password ab12! is not valid

Register With Valid Username And Long Enough Password Containing Only Letters
    Input New Command And Create User  koodari  abcdefghijkl
    Output Should Contain  Password abcdefghijkl is not valid


*** Keywords ***
Input New Command And Create User
    [Arguments]  ${username}  ${password}
    Input New Command
    Input  ${username}
    Input  ${password}
    Run Application
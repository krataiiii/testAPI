***Settings***
Library     Collections
Library     BuiltIn
Library     String
Library     HttpLibrary.HTTP
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

Resource    ../Resources/Variable.robot


***Keywords***
Call Api With User ${user} And Response Status ${response_status}
    Create Session  mysession  ${url}  verify=true
    ${response}=  GET On Session  mysession  /api/users/${user}     expected_status=any
    Status Should Be  ${response_status}  ${response}
    ${json}  Set Variable    ${response.json()}
    Set Test Variable    ${json}    &{json}

Verify Response Return Id Value As ${number} Correctly
    ${actual_id}      Set Variable        ${json.data.id}
    Should Be Equal     ${actual_id}       ${number}      

Verify Email In Response As ${email} Correctly
    ${actual_email}      Set Variable        ${json.data.email}
    Should Be Equal     ${actual_email}       ${email}      

Verify First and Last In Response Correctly
    [Arguments]     ${first_name}       ${last_name}
    ${actual_first_name}      Set Variable        ${json.data.first_name}
    ${actual_last_name}      Set Variable        ${json.data.last_name}
    Should Be Equal     ${actual_first_name}       ${first_name}    
    Should Be Equal     ${actual_last_name}       ${last_name}    

Verify Avatar Link In Response Correctly
    ${actual_avatar_link}      Set Variable        ${json.data.avatar}
    Should Be Equal     ${actual_avatar_link}       ${expected_avatar_link}

Verify Response Body When Api Fail
    Should Be Empty     ${json}

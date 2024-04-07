***Settings***
Resource        ../Keywords/Keyword.robot
  

***Test Cases***
[TC-1] - Get user profile success
    [Documentation]    To verify get user  profile api will return correct data  when trying to get  profile of existing  user
    Call Api With User 12 And Response Status 200
    Verify Response Return Id Value As ${12} Correctly
    Verify Email In Response As rachel.howell@reqres.in Correctly
    Verify First and Last In Response Correctly     Rachel      Howell
    Verify Avatar Link In Response Correctly

[TC-2] - Get user profile but user not found
    [Documentation]    To verify get user  profile api will return 404 not found when trying to get exist profile  of not existing user
    Call Api With User 1234 And Response Status 404
    Verify Response Body When Api Fail
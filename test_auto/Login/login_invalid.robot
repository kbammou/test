

*** Settings ***

Documentation     A test suite containing tests related to  login.
...
...               These tests are data-driven by their nature. They use several
...               keywords, some of them are test case specific, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.


Suite Setup             Open Browser To Home Page      ${REF HOME LOCATION}      ${REF TITLE}       
#Suite Teardown    	    Close Browser
Test Template           Check Login Form
Test Setup              Go To Page                     	${REF LOGIN LINK}        ${REF LOGIN LOCATION}       ${REF TITLE}
Resource                resource.robot

*** Variable ***

${INPUT USERNAME}                               username
${INPUT PASSWORD}                               password
${LINK CHANGE PASSWORD}                         //a[contains(text(),'Change password')]
${REF VALID ADMIN LOG}                          admin
${REF VALID ADMIN PWD}                          M1daj@zif!krt
${IMAGE LOGO MMW}                               //img[@class='mmw-logo']








*** Test Case ***                       USER NAME                   PASSWORD


EmptyUsernameAndPassword             	${EMPTY}                    ${EMPTY}
EmptyUsername                        	${EMPTY}                    ${REF VALID ADMIN PWD}
EmptyPassword                        	${REF VALID ADMIN LOG}      ${EMPTY}
InvalidUsername                        	totouser                    ${REF VALID ADMIN PWD}
InvalidPassword                        	${REF VALID ADMIN LOG}      titipass
InvalidUsernameAndPassword           	tatauser                    lolopass





*** Keywords ***

Check Login Form
    [Arguments]                         ${username}                	 ${password}

    
    Wait Until Page Contains Element	${BUTTON SUBMIT}
    Input Username                      ${username}
    Input Mdp                   	    ${password}
    Click Button                       	${BUTTON SUBMIT}
    Sleep                               ${REF SLEEP}
    #Click Link                         ${REF LOGOUT LINK}
    #Sleep                       		${REF SLEEP}
    Login Should Have Failed
    Click IMAGE                       	${IMAGE LOGO MMW}


Input Fields Should Exist
    Wait Until Page Contains Element	${BUTTON SUBMIT}
    Page Should Contain Element		    ${INPUT USERNAME}
    Page Should Contain Element		    ${INPUT PASSWORD}
    Page Should Contain Element		    ${LINK CHANGE PASSWORD}
    Page Should Contain Element
    
Login Should Have Failed
    Location Should Be                  ${REF HOME LOCATION}${REF LOGIN URL}
    Page Should Contain Element         ${INPUT USERNAME}
    Page Should Contain Element         ${INPUT PASSWORD}
    Page Should Contain Element		    ${LINK CHANGE PASSWORD}
    Page Should Contain Element         ${BUTTON SUBMIT}




Input Username
    [Arguments]    					    ${username}
    Input Text    						${INPUT USERNAME}           ${username}

Input Mdp
    [Arguments]    					    ${password}
    Input Password       				${INPUT PASSWORD}           ${password}

Go To Page
	[Arguments]		            	${url}              		${location}     	${title}
	Click Link		                ${url}
	Sleep                        	${REF SLEEP}
	Page Should Be Open          	${location}         		${title}






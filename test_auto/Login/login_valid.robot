

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
Suite Teardown    	    Close Browser
Test Template           Check Login Form
Test Setup              Go To Page                     	${REF LOGIN LINK}            ${REF LOGIN LOCATION}        ${REF TITLE}
Resource                resource.robot

*** Variable ***

${INPUT USERNAME}                               username
${INPUT PASSWORD}                               password
${REF VALID ADMIN LOG}                          admin
${REF VALID ADMIN PWD}                          M1daj@zif!krt
${REF VALID USER LOG}                           po_user
${REF VALID USER PWD}                           po_user
${REF VALID PROFESSIONNEL LOG}                  po-pro1
${REF VALID PROFESSIONNEL USER PWD}             po-pro1
${LINK CHANGE PASSWORD}                         //a[contains(text(),'Change password')]





*** Test Case ***                           USER NAME                               PASSWORD

ValidAdminUsernameAndPass           		${REF VALID ADMIN LOG}                  ${REF VALID ADMIN PWD}
ValidUserUsernameAndPass                    ${REF VALID USER LOG}                   ${REF VALID USER PWD}
ValidProfessionnelUsernameAndPass           ${REF VALID PROFESSIONNEL LOG}          ${REF VALID PROFESSIONNEL USER PWD}



*** Keywords ***


Check Login Form
    [Arguments]                    	    ${username}                	${password}
    Input Fields Should Exist
    Input Text                      	${INPUT USERNAME}           ${username}
    Input Password                    	${INPUT PASSWORD}           ${password}
    Click Button                       	${BUTTON SUBMIT}
    Sleep                               ${REF SLEEP}
    Click Link                          ${REF LOGOUT LINK}
    #Sleep                       		${REF SLEEP}
    Login Should Redirect To Home

Go To Page
	[Arguments]		            	${url}              		${location}     	${title}
	Click Link		                ${url}
	Sleep                        	${REF SLEEP}
	Page Should Be Open          	${location}         		${title}


Input Fields Should Exist
    Wait Until Page Contains Element	${BUTTON SUBMIT}
    Page Should Contain Element		    ${INPUT USERNAME}
    Page Should Contain Element		    ${INPUT PASSWORD}
    Page Should Contain Element		    ${LINK CHANGE PASSWORD} 
    

Login Should Redirect To Home
    Location Should Be                  ${REF HOME LOCATION}
    Page Should Not Contain Element     ${INPUT USERNAME}
    Page Should Not Contain Element     ${INPUT PASSWORD}



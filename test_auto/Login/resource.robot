
*** Settings ***

Documentation   A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
...				Resource.robot is used for common action and shared arguments.
...				REF prefix is used for shared arguments.
Library			SeleniumLibrary
Library        	Collections
Library			BuiltIn
Library			String


*** Variable ***

${REF BROWSER}                      chrome
${REF TITLE}                        Map My World - By Sogeti©
${BUTTON SUBMIT}                                //button[contains(text(),'Login')]
${REF LOGOUT LINK}                  //a[@id='Logout']
${REF LOGIN LINK}                   Log In
${REF LOGIN URL}	                SignIn/
${REF SLEEP}                        2s
${REF HOME LOCATION}                https://mmw-pprod.innovation-factory.io/#/  
${REF LOGIN LOCATION}               ${REF HOME LOCATION}${REF LOGIN URL}



*** Keywords ***

Open Browser To Home Page
	[Arguments]		            	${location}					${REF TITLE}
    Open Browser                 	${REF HOME LOCATION}    	${REF BROWSER}      
    Page Should Be Open				${location}		    		${REF TITLE}



Page Should Be Open
	[Arguments]		            	${location}		    		${title}
	Location Should Be		        ${location}
	Title Should Be			    	${title}
	

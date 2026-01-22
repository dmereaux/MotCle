*** Settings ***

Test Setup    Ouvrir Prestashop
Test Teardown    Fermer Prestashop
Library   SeleniumLibrary   #implicit_wait=5
*** Variables ***
${URL}   http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${NAVIGATEUR}     GC
${LOC_LOGO}   xpath=//*[@id="_desktop_logo"]//a/img

*** Test Cases ***
Test page accueil
    Aller a la page d'accueil
    Verifier titre page monPrestashop

*** Keywords ***
Ouvrir Prestashop
   Open Browser  ${URL}  ${NAVIGATEUR}  
Fermer Prestashop
  Close Browser
verifier titre page ${titre}
    Title Should Be   ${titre}
Aller a la page d'accueil
    Wait Until Element Is Enabled   ${LOC_LOGO}
    click element    ${LOC_LOGO}
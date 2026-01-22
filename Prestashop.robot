*** Settings ***

Test Setup    Ouvrir Prestashop
Test Teardown    Fermer Prestashop
Library   SeleniumLibrary   #implicit_wait=5
*** Variables ***
${URL}   http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${NAVIGATEUR}     GC
${LOC_LOGO}   xpath=//*[@id="_desktop_logo"]//a/img
${LOC_CHAMP_RECHERCHE}   xpath=//*[@id="search_widget"]/form/input[2]
${LOC_RESULTATS}   //*[@id="js-product-list-top"]/div[1]/p

*** Test Cases ***
Test page accueil
    Aller a la page d'accueil
    Verifier titre page monPrestashop
Test recherche mug
   lancer recherche avec mug
   verifier message Il y a 5 produits.

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
lancer recherche avec ${item}
    input text    ${LOC_CHAMP_RECHERCHE}    ${item}
    Press Keys	${LOC_CHAMP_RECHERCHE}	RETURN
verifier message ${msg}
  Wait Until Element Is Visible   ${LOC_RESULTATS}  5s
  Element Text Should Be     ${LOC_RESULTATS}   ${msg}

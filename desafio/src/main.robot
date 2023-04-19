*** Settings ***
Library     String
Library     Browser
Library     DateTime
Library     Collections
Library     FakerLibrary    locale=pt_BR
Library     ./shared/libs/faker_addon.py
Resource    ./shared/constants.robot
Resource    ./shared/hooks.robot
Resource    ./pages/login/login_page.robot
Resource    ./pages/home/home_page.robot
Resource    ./pages/users/users_page.robot

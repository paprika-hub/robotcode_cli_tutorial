*** Settings ***
Library         Browser
Library         Collections

Suite Setup     New Browser    ${BROWSER}    ${HEADLESS}
Test Setup      New Page    ${URL}
# Test Setup    New Page    https://todomvc.com/examples/emberjs/todomvc/dist/


*** Variables ***
${URL}      https://todomvc.com/examples/react/dist/
${BROWSER}    chromium
${HEADLESS}    Yes


*** Test Cases ***
Simple Todo
    [Tags]    regression
    Add Todo    Do Something Really Funny
    Take Screenshot
    VAR    ${count}    1
    Check Item Count    ${count}

Add A List Of Todos
    [Tags]    wip
    VAR    @{items}    Bread    Butter    Milk
    FOR    ${i}    IN    @{items}
        Add Todo    ${i}
    END
    Append To List    ${items}    Flowers
    Close Page




*** Keywords ***
Add Todo
    [Arguments]    ${text}
    Fill Text    .new-todo    ${text}
    Press Keys    .new-todo    Enter

Check Item Count
    [Arguments]    ${count}
    Get Text    span.todo-count    matches    ${count} items? left*

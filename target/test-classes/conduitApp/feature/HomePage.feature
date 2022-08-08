Feature: HomePage Gets
Background: Define URL
    Given url 'https://api.realworld.io/api/' 
    Scenario: Get all tags
        Given path 'tags'
        When method GET
        Then status 200
        And match resonse.tags contains 'cars'
        And match response.tags !contains 'boat'
        And match response.tags == "#array"
        And match response.tags each == "#string"

    Scenario: Get 10 articles
        Given param {limit=10, offset = 0}
        Given path 'articles'
        When method GET
        Then status 200
        And match response.articles contains ['author', 'username']
        And match response.articles == "#[10]"
        And match response.articlesCount == 500

        

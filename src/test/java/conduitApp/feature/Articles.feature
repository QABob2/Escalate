Feature: Articles

Background: Login for authorization
    Given url 'https://api.realworld.io/api/' 
    Given path 'users/login'
    And request {"user": {"email": "karate@123.com", "password": "karate1"}}
    When method Post
    Then status 200
    * def token = response.user.token

Scenario: Create article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And resquest {"article": {"tagList": [],"title": "Another3","description": "Article","body": "something here"}}
    When method Post
    Then status 200
    And match response.article.title == 'Another3'
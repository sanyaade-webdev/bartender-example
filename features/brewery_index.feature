Feature: List breweries

  In order to manage breweries
  As a user
  I want to be able to list breweries

  Scenario: Listing breweries
    Given the following user exists:
      | id |
      | 1  |
    And the following breweries exist:
      | id | user_id | name          | url                            | created_at | updated_at |
      | 1  |         | Southern Tier | http://southerntierbrewing.com | 2010-01-01 | 2010-02-02 |
      | 2  | 1       | Abita         | http://abita.com               | 2010-03-03 | 2010-04-04 |
      | 3  |         | Russian River | http://russianriverbrewing.com | 2010-05-05 | 2010-06-06 |
    When I am on the breweries page
    Then I should see the following breweries:
      | id | user_id | name          | url                            | created_at | updated_at |
      | 2  | 1       | Abita         | http://abita.com               | 2010-03-03 | 2010-04-04 |
      | 3  |         | Russian River | http://russianriverbrewing.com | 2010-05-05 | 2010-06-06 |
      | 1  |         | Southern Tier | http://southerntierbrewing.com | 2010-01-01 | 2010-02-02 |

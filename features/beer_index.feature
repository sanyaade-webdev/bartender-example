Feature: List beers

  In order to manage beers
  As a user
  I want to be able to list beers

  Scenario: Listing beers
    Given the following user exists:
      | id |
      | 1  |
    And the following breweries exist:
      | id | user_id | name          | url                            | created_at | updated_at |
      | 1  |         | Southern Tier | http://southerntierbrewing.com | 2010-01-01 | 2010-02-02 |
      | 2  | 1       | Abita         | http://abita.com               | 2010-03-03 | 2010-04-04 |
      | 3  |         | Russian River | http://russianriverbrewing.com | 2010-05-05 | 2010-06-06 |
    And the following beers exist:
      | id | user_id | brewery_id | name               | created_at | updated_at |
      | 1  |         | 1          | Pumpking           | 2010-01-01 | 2010-02-02 |
      | 2  | 1       | 3          | Pliney the Elder   | 2010-03-03 | 2010-04-04 |
      | 3  |         | 2          | Strawberry Harvest | 2010-05-05 | 2010-06-06 |
    When I am on the beers page
    Then I should see the following beers:
      | id | user_id | brewery_id | brewery_name  | name               | created_at | updated_at |
      | 2  | 1       | 3          | Russian River | Pliney the Elder   | 2010-03-03 | 2010-04-04 |
      | 1  |         | 1          | Southern Tier | Pumpking           | 2010-01-01 | 2010-02-02 |
      | 3  |         | 2          | Abita         | Strawberry Harvest | 2010-05-05 | 2010-06-06 |

Feature: View a beer

  In order to manage a beer
  As a user
  I want to be able to view a beer

  Background:
    Given the following breweries exist:
      | id | name  |
      | 1  | Abita |
    And the following beer exists:
      | id | brewery_id | name               | description | abv | created_at | updated_at |
      | 1  | 1          | Strawberry Harvest | Southern.   | 4.2 | 2010-01-01 | 2010-02-02 |

  Scenario: Viewing a beer
    When I am on the "Strawberry Harvest" beer page
    Then I should see the following beer:
      | id | brewery_id | brewery_name | name               | description | abv | created_at | updated_at |
      | 1  | 1          | Abita        | Strawberry Harvest | Southern.   | 4.2 | 2010-01-01 | 2010-02-02 |

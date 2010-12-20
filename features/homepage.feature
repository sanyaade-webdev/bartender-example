Feature: Homepage

  Scenario: Viewing the homepage
    Given the following breweries exist:
      | id | name          |
      | 1  | Abita         |
      | 2  | Southern Tier |
    And the following beer exists:
      | id | brewery_id | name               |
      | 1  | 1          | Amber              |
      | 2  | 1          | Strawberry Harvest |
      | 3  | 2          | Pumpking           |
    When I am on the homepage
    Then I should see "2 breweries"
    And I should see "3 beers"

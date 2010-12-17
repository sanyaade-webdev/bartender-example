Feature: View a brewery

  In order to manage a brewery
  As a user
  I want to be able to view a brewery

  Background:
    Given the following brewery exists:
      | id | name          | url                            | created_at | updated_at |
      | 1  | Southern Tier | http://southerntierbrewing.com | 2010-01-01 | 2010-02-02 |

  Scenario: Viewing a brewery
    When I am on the "Southern Tier" brewery page
    Then I should see the following brewery:
      | id | name          | url                            | created_at | updated_at |
      | 1  | Southern Tier | http://southerntierbrewing.com | 2010-01-01 | 2010-02-02 |

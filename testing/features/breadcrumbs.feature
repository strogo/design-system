@not_mobile @NP-1253
Feature: Breadcrumbs component

  The Breadcrumbs component allows users to see a navigable path to their
  previous content pages they have traversed through

  Rule: Default Breadcrumb
    Background:
      Given a Default Breadcrumbs component is on the page

    Scenario: Breadcrumbs only link up till the last one
      Then a series of breadcrumbs are present
      And the initial breadcrumbs are all links
      But the final breadcrumb isn't a link

  Rule: No Collapse Breadcrumb
    Background:
      Given a No Collapse Breadcrumbs component is on the page

    Scenario: Breadcrumbs only link up till the last one
      Then a series of breadcrumbs are present
      And the initial breadcrumbs are all links
      But the final breadcrumb isn't a link

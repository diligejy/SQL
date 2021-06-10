## 1. Problem

    Before tackling search, the product team wants to make sure that the engineering team's time will be well-spent in doing so. After all, each new feature comes at the expense of some other potential feature(s). The product team is most interested in determining whether they should even work on search in the first place and, if so, how they should modify it.

## 2. Getting oriented

    Before looking at the data, develop some hypotheses about how users might interact with search. What is the purpose of search? How would you know if it is fulfilling that purpose? How might you (quantitatively) understand the general quality of an individual user's search experience?

## 3. [Data](https://mode.com/sql-tutorial/understanding-search-functionality/#the-data)

    There are two tables that are relevant to this problem. Most critically, there are certain events that you will want to look into in the events table below:

    - search_autocomplete: This is logged when a user clicks on a search option from autocomplete
    - search_run: This is logged when a user runs a search and sees the search results page.
    - search_click_X: This is logged when a user clicks on a search result. X, which ranges from 1 to 10, describes which search result was clicked.

    The tables names and column definitions are listed below—click a table name to view information about that table.    

## 4. Making a recommendation

    In particular, you should seek to answer the following questions:

    - Are users' search experiences generally good or bad?
    - Is search worth working on at all?
    - If search is worth working on, what, specifically, should be improved?
    
    Come up with a brief presentation describing the state of search at Yammer. Display your findings graphically. You should be prepared to recommend what, if anything, should be done to improve search. If you determine that you do not have sufficient information to test anything you deem relevant, discuss the caveats.
## 1. Problem

On July 1, you check the results of the A/B test. **You notice that message posting is 50% higher** in the treatment group—a huge increase in posting. The table below summarizes the results:

[Average Messages Sent](https://app.mode.com/benn/reports/4194f44b1866/runs/dfb63bac58ab/embed)

Furthermore, the test above uses a two-tailed test because the treatment group could perform either better or worse than the control group. (Some argue that one-tailed tests are better, however.) You can read more about the differences between one- and two-tailed t-tests here.

## 2. [Data](https://mode.com/sql-tutorial/validating-ab-test-results/#the-data)

## 3. Validating the results

Work through your list of hypotheses to determine whether the test results are valid. We suggest following the steps (and answer the questions) below:

- Check to make sure that this test was run correctly. Is the query that calculates lift and p-value correct? It may be helpful to start with the code that produces the above query, which you can find by clicking the link in the footer of the chart and navigating to the "query" tab.

- Check other metrics to make sure that this outsized result is not isolated to this one metric. What other metrics are important? Do they show similar improvements? This will require writing additional SQL queries to test other metrics.

- Check that the data is correct. Are there problems with the way the test results were recorded or the way users were treated into test and control groups? If something is incorrect, determine the steps necessary to correct the problem.

- Make a final recommendation based on your conclusions. Should the new publisher be rolled out to everyone? Should it be re-tested? If so, what should be different? Should it be abandoned entirely?

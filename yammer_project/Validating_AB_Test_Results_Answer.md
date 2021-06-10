## 1. Preparation and prioritizing

**A/B tests can alter user behavior in a lot of ways, and sometimes these changes are unexpected. Before digging around test data, it's important to hypothesize how a feature might change user behavior, and why.** If you identify changes in the data first, it can be very easy to rationalize why these changes should be obvious, even if you never would have have thought of them before the experiment.

For this problem, a number of factors could explain the anomalous test. Here are a few examples:

- **This metric is incorrect or irrelevant**: Posting rates may not be the correct metric for measuring overall success. It describes how Yammer's customers use the tool, but not necessarily if they're getting value out of it. For example, while a giant "Post New Message" button would probably increase posting rates, it's likely not a great feature for Yammer. You may want to make sure the test results hold up for other metrics as well.

- **The test was calculated incorrectly**: A/B tests are statistical tests. People calculate results using different methods—sometimes that method is incorrect, and sometimes the arithmetic is done poorly.

- **The users were treated incorrectly**: Users are supposed to be assigned to test treatments randomly, but sometimes bugs interfere with this process. If users are treated incorrectly, the experiment may not actually be random.

- **There is a confounding factor or interaction effect**: These are the trickiest to identify. Experiment treatments could be affecting the product in some other way—for example, it could make some other feature harder to find or create incongruous mobile and desktop experiences. These changes might affect user behavior in unexpected ways, or amplify changes beyond what you would typically expect.

## 2. Validating the results

1. The number of messages sent shouldn't be the only determinant of this test's success, so dig into a few other metrics to make sure that their outcomes were also positive.

   In particular, we're interested in metrics that determine if a user is getting value out of Yammer. (Yammer typically uses login frequency as a core value metric.)

2. First, the average number of logins per user is up. This suggests that not only are users sending more messages, but they're also signing in to Yammer more.

   [Average Logins](https://app.mode.com/benn/reports/ff3bdfe7f1ef/runs/e3dcd3a14b75/embed)

3. Second, users are logging in on more days as well (days engaged the distinct number of days customers use Yammer).

   If this metric were flat and logins were up, it might imply that people were logging in and logging out in quick succession, which could mean the new feature introduced a login bug.

   But both metrics are up, so it appears that the problem with this tests isn't cherry-picking metrics—things look good across the board.

   [Average Days Engaged](https://app.mode.com/benn/reports/9a0426b46f22/runs/efebd36c1884/embed)

4. Reasonable people can debate which mathematical methods are best for an A/B test, and arguments can be made for some changes (1-tailed vs. 2-tailed tests, required sample sizes, assumptions about sample distributions, etc.). Nontheless, these other methods don't materially affect the test results here. For more on the math behind A/B testing, this [Amazon's post](https://developer.amazon.com/blogs/home/tag/AB+Testing) and [evan miller's blog](https://www.evanmiller.org/index.html)

5. The test, however, does suffer from a methodological error. The test lumps new users and existing users into the same group, and measures the number of messages they post during the testing window.

   This means that a user who signed up in January would be considered the same way as a user who signed up a day before the test ended, even though the second user has much less time to post messages.

   It would make more sense to consider new and existing users separately. Not only does this make comparing magnitudes more appropriate, be it also lets you test for novelty effects. Users familiar with Yammer might try out a new feature just because it's new, temporarily boosting their overall engagement. For new users, the feature isn't "new," so they're much less likely to use it just because it's different.

6. **Investigating user treatments (or splitting users out into new and existing cohorts) reveals the heart of the problem—all new users were treated in the control group.**

   [Treatments by Month Activated](https://app.mode.com/benn/reports/4a83b254000f/runs/637790980c2e/embed)

7. This creates a number of problems for the test. Because these users have less time to post than existing users, all else equal, they would be expected to post less than existing users given their shorter exposure to Yammer. Including all of them in the control group lowers that group's overall posting rate. Because of this error, you may want to analyze the test in a way that ignores new users. As you can see from below, when only looking at posts from new users, the test results narrow considerably.

   [Treatments by Month Activated](https://app.mode.com/benn/reports/4a83b254000f/runs/637790980c2e/embed)

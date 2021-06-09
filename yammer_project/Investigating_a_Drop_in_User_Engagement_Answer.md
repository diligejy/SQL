## Preparation and prioritizing

- It's impossible to provide an exhaustive list of possibilities for this kind of problem, but here are some things we came up with in our brainstorming session:

  - Holiday: It's likely that people using a work application like Yammer might engage at a lower rate on holidays. If one country has much lower engagement than others, it's possible that this is the cause.

  - Broken feature: It is possible that something in the application is broken, and therefore impossible for people to use. This is a little harder to pinpoint because different parts of the application would show differently in the metrics. For example, if something in the signup flow broke, preventing new users from joining Yammer, growth would also be down. If a mobile app was unstable and crashed, engagement would be down for only that device type.

  - Broken tracking code: It's possible that the code that logs events is, itself, broken. If you see a drop to absolutely zero events of a certain type and you rule out a broken feature, then this is a possibility.

  - Traffic anomalies from bots: Most major website see a lot of activity from bots. A change in the product or infrastructure that might make it harder for bots to interact with the site could decrease engagement (assuming bots look like real users). This is tricky to determine because you have to identify bot-like behavior through patterns or specific events.
    Traffic shutdown to your site: It is possible for internet service providers to block your site. This is pretty rare for professional applications, but nevertheless possible.

  - Marketing event: A Super Bowl ad, for example, might cause a massive spike in sign-ups for the product. But users who enter through one-time marketing blitzes often retain at lower rates than users who are referred by friends, for example. Because the chart uses a rolling 7-day period, this will register as high engagement for one week, then almost certainly look like a big drop in engagement the following week. Most often, the best way to determine this is to simply ask someone in the Marketing department if anything big happened recently.

> That's a lot of possibilities, so it's important to move through them in the most efficient order possible. Here are some suggestions for how to sort them so that you don't waste time:

- Experience: This isn't particularly relevant for those of you who have not worked in industry before, but once you have seen these problems a couple time, you will get a sense for the most frequent problems.

- Communication: It's really easy to ask someone about marketing events, so there's very little reason not to do that. Unfortunately, this is also irrelevant for this example, but it's certainly worth mentioning.

- Speed: Certain scenarios are easier to test than others, sometimes because the data is cleaner or easier to understand or query, sometimes because you've done something similar in the past. If two possibilities seem equally likely, test the faster one first.

- Dependency: If a particular scenario will be easy to understand after testing a different scenario, then test them in the order that makes sense.

## Solving the case

1. One of the easiest things to check is growth, both because it's easy to measure and because most companies (Yammer included) track this closely already. In this case, you have to make it yourself, though. You'll notice that nothing has really changed about the growth rate—it continues to be high during the week, low on weekends:

   [Daily Signups](https://app.mode.com/modeanalytics/reports/9406529cf9a9/runs/0786db69091e/embed)

2. Since growth is normal, it's possible that the dip in engagement is coming from existing users as opposed to new ones. One of the most effective ways to look at this is to cohort users based on when they signed up for the product. This chart shows a decrease in engagement among users who signed up more than 10 weeks prior:

   [Engagement by User Age Cohort](https://app.mode.com/modeanalytics/reports/b87dc5c175a7/runs/8c9cb7705e1b/embed)

3. The understanding that the problem is localized to older users leads us to believe that the problem probably isn't related to a one-time spike from marketing traffic or something that is affecting new traffic to the site like being blocked or changing rank on search engines. Now let's take a look at various device types to see if the problem is localized to any particular product:

   [Weekly Engagement by Device Category](https://app.mode.com/modeanalytics/reports/32d25b4a8b00/runs/89d67e419adb/embed)

4. If you filter the above chart down to phones (double-click the dot next to "phone" in the legend), you will see that there's a pretty steep drop in phone engagement rates. **So it's likely that there's a problem with the mobile app related to long-time user retention.** At this point, you're in a good position to ask around and see if anything changed recently with the mobile app to try to figure out the problem. You might also think about what causes people to engage with the product. The purpose of the digest email mentioned above is to bring users back into the product. Since we know this problem relates to the retention of long-time users, it's worth checking out whether the email has something to do with it:

   [Email Actions](https://app.mode.com/modeanalytics/reports/8d9722caeccb/runs/692925581af1/embed)

5. If you filter to clickthroughs (again, by clicking the dot in the legend), you'll see that clickthroughs are way down. **This next chart shows in greater detail clickthrough and open rates of emails, indicating clearly that the problem has to do with digest emails in addition to mobile apps.**

   [Open and CT Rates](https://app.mode.com/modeanalytics/reports/d8c4d3c11ea3/runs/43cdd26cce26/embed)

## Follow through

- After investigation, it appears that the problem has to do with mobile use and digest emails. The intended action here should be clear: notify the head of product (who approached you in the first place) that the problem is localized in these areas and that it's worth checking to make sure something isn't broken or poorly implemented.

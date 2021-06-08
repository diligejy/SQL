## 1. Problem

    What caused the dip at the end of the chart shown above and, if appropriate, recommending solutions for the problem

## 2. Engagement(defined by Yammer)

    The number of users who logged at least one engagement event during the week starting on that date

- 참고 자료 : [User Engagement](https://www.parlor.io/blog/user-engagement-what-it-is-why-you-might-be-measuring-it-wrong/)

## 3. Advice

- Before you even touch the data, come up with a list of possible causes for the dip in retention
- Make sure to note how you will test each hypothesis.
- Think carefully about the criteria you use to order them and write down the criteria as well.

## 4. Digging in

- For this problem, you will need to use four tables. The tables names and column definitions are listed below—click a table name to view information about that table. Note: this data is fake and was generated for the purpose of this case study. It is similar in structure to Yammer's actual data, but for privacy and security reasons it is not real.

- Table 1: Users

  ```
  user_id : A unique ID per user. Can be joined to user_id in either of the other tables.

  created_at:	The time the user was created (first signed up)

  state:	The state of the user (active or pending)

  activated_at:	The time the user was activated, if they are active

  company_id:	The ID of the user's company

  language:	The chosen language of the user
  ```

- Table 2: Events

  ```
  user_id:	The ID of the user logging the event. Can be joined to user\_id in either of the other tables.

  occurred_at:	The time the event occurred.

  event_type:	The general event type. There are two values in this dataset: "signup_flow", which refers to anything occuring during the process of a user's authentication, and "engagement", which refers to general product usage after the user has signed up for the first time.

  event_name:	The specific action the user took. Possible values include: create_user: User is added to Yammer's database during signup process enter_email: User begins the signup process by entering her email address enter_info: User enters her name and personal information during signup process complete_signup: User completes the entire signup/authentication process home_page: User loads the home page like_message: User likes another user's message login: User logs into Yammer search_autocomplete: User selects a search result from the autocomplete list search_run: User runs a search query and is taken to the search results page search_click_result_X: User clicks search result X on the results page, where X is a number from 1 through 10. send_message: User posts a message view_inbox: User views messages in her inbox

  location:	The country from which the event was logged (collected through IP address).

  device:	The type of device used to log the event.
  ```

- Table 3: Email Events

  ```
  user_id:	The ID of the user to whom the event relates. Can be joined to user_id in either of the other tables.

  occurred_at:	The time the event occurred.

  action:	The name of the event that occurred. "sent_weekly_digest" means that the user was delivered a digest email showing relevant conversations from the previous day. "email_open" means that the user opened the email. "email_clickthrough" means that the user clicked a link in the email.
  ```

- Table 4: Rollup Periods

  ```
  period_id:	This identifies the type of rollup period. The above dashboard uses period 1007, which is rolling 7-day periods.

  time_id:	This is the identifier for any given data point — it's what you would put on a chart axis. If time_id is 2014-08-01, that means that is represents the rolling 7-day period leading up to 2014-08-01.

  pst_start:	The start time of the period in PST. For 2014-08-01, you'll notice that this is 2014-07-25 — one week prior. Use this to join events to the table.

  pst_end:	The start time of the period in PST. For 2014-08-01, the end time is 2014-08-01. You can see how this is used in conjunction with pst_start to join events to this table in the query that produces the above chart.

  utc_start:	The same as pst_start, but in UTC time.

  pst_start:	The same as pst_end, but in UTC time.
  ```


## 5. Making a recommendation

- Start to work your way through your list of hypotheses in order to determine the source of the drop in engagement.

Answer the following questions:

   - Do the answers to any of your original hypotheses lead you to further questions?
   - If so, what are they and how will you test them?
   - If they are questions that you can't answer using data alone, how would you go about answering them (hypothetically, assuming you actually worked at this company)?
   - What seems like the most likely cause of the engagement dip?
   - What, if anything, should the company do in response?
![github_banner](http://res.cloudinary.com/chi6rag/image/upload/v1431578923/HourGlass/hourglass_banner.png)

HourGlass
=========

HourGlass lets you track the time you spend physically at a location.

Application Workflow (Version 0)
--------------------------------

######Authenticated User
- Logs in
- For one particular day ( from 00:00 hrs to 23:59 hrs )
    - Views a page asking him to enter CheckIn time
        - Enters CheckIn time
        - Sees CheckIn time recorded 
    		- Views an option asking him to enter CheckOut time
    - Views a page/input asking him to enter CheckOut time
        - Enters CheckOut time
        - Sees CheckOut time recorded
    - Views the time spent at work physically once checkout time is entered
- Views time spent physically at work
    - For a day
    - For a week
    - For a month
    - For three months
- Cannot update records for any other user

######Authenticated Admin
- Logs in
- Authorized to do everything that an authenticated user can do
- Has ability to update records of all the users
- Views time spent physically at work
    - by each user
    - by all users
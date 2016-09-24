# Philosophy

Soul Medicine is a pretty simple application from a user's perspective. In that, the user sign's up and once verified, they can start to receive messages. From an administrative perspective however, there are quite a lot of complexities that take place in order for those messages to be delivered seamlessly. Core among them is the notion that courses, subjects and lessons all flow well with each other. To better facilitate this, Soul Medicine ships with an Admin panel to allow easier database interactions. This section explains how to use the Admin panel and why it's built the way it is.

# Overview

## Users

There are two types of users in Soul Medicine. 

* **Users** are those that sign up for the service and receive messages
* **Admins** are those that manage the service and have access to the Admin Panel. Within admins, there are sub roles:
  * **Admins** - Users that have access to all of the functions of the application and can make any change at any time
  * **Super Users** - Users that see all of the pages but cannot add new admin users
  * **Course Users** - Users that can manage any course page and can approve or delete any aspect of a course
  * **Translators** - Users that can only add translations to lessons but have access to view all of the course pages
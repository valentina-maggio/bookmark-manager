# Bookmark Manager

A bookmark manager app built using a database.

## Domain model

![screenshot](https://github.com/valentina-maggio/bookmark-manager/blob/main/assets/Screenshot%202022-03-14%20at%2014.32.35.png)

## Database instructions

1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the pqsl command `\c bookmark_manager;`
4. Run the query saved in the file 01_create_bookmarks_table.sql
5. Alter bookmark table by running the query saved in the file 02_add_title_to_bookmarks.sql
6. Create comments table by running the query saved in the file 03_create_comments_table.sql
7. Create test database using psql command `CREATE DATABASE bookmark_manager_test;`
8. Connect to the database using the pqsl command `\c bookmark_manager_test;`
9. Follow steps 4, 5, 6 again
10. 

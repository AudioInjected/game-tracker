# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- 
- I used the Sinatra gem as well as a few others such as shotgun to help make this app. I have an app directory where I have the models, views, and controllers
- 
- [x] Use ActiveRecord for storing information in a database 
- 
- I used ActiveRecord to persist data through an ORM.
- There are classes that are used to access tables and used instances of the class to reify the object from a row in the database
- 
- [x] Include more than one model class (e.g. User, Post, Category)
- 
- There is a User, Game, Genre, and GameGenre model class
- 
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) 
- The User model has a "has_many" relationship with the Game model. A User has many Games. A game also has many Genres.
- 
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- 
- The Games model has a "belongs_to" relationship with Users. A Game belongs to a User
- 
- [x] Include user accounts with unique login attribute (username or email)
- 
- The user model has "validates_uniqueness_of" which only allows users with unique usernames and emails to be stored in the database
- 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- 
- There is a GET /games/new and POST /games route for creating a new game, a GET /games/:id route for reading a game, a GET games/:id/edit and a PATCH /games/:id route to edit a game, and a DELETE /games/:id route to delete a game
- 
- [x] Ensure that users can't modify content created by other users
- 
- There is a helper method current_user that will reify a user from the Users table based on the user id in the session. A user is allowed to edit the game only if the game belongs to the user  
- 
- [x] Include user input validations
- 
- A User can not leave the username, email, or password blank, same for the Games attributes. Each model has a validation for its attributes except Genres. Genres are already created
- 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- 
- There are flash messages for when a user logs in and out successfuly, enters an invalid username or password, or tries to create a new game when not logged in
- 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

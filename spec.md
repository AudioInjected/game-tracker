# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app: This app uses the Sinatra gem to build a simple MVC CRUD app
- [x] Use ActiveRecord for storing information in a database: This app uses the ActiveRecord gem to persist data through an ORM. There are models that are used to access tables reify 
- [x] Include more than one model class (e.g. User, Post, Category)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts): The User model has a "has_many" relationship with the Game model. A User has many Games
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User): The Games model has a "belongs_to" relationship with Users. A Game belongs to a User
- [x] Include user accounts with unique login attribute (username or email): The user model has "validates_uniqueness_of" which only allows users with unique usernames and emails to be stored in the database
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: There is a GET /games/new and POST /games route for creating a new game, a GET /games/:id route for reading a game, a GET games/:id/edit and a PATCH /games/:id route to edit a game, and a DELETE /games/:id route to delete a game
- [x] Ensure that users can't modify content created by other users: There is a helper method current_user that will reify a user from the Users table based on the user id in the session. A user is allowed to edit the game only if the game belongs to the user  
- [x] Include user input validations: A User can not leave the username, email, or password blank, same for the Games attributes. Each model has a validation
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message

# README

A quick connect 4 game. Be careful what you click for, you only get a total of 42 clicks before a draw is called.

# setup and installation
clone this repository
cd into the connect4 directory
run `$bundle install`
start the rails server `$rails s`
navigate to localhost:3000 is your browser

# inspiration
The code for styling for the connect4 board was modified after this [blog post](https://medium.com/@shirleyl/connect-4-from-cli-to-rails-app-fc9cad0d948f). The code to detect horizontal, vertical, and diagonal wins was modified. Modifications were inspired by [this JavaScript](https://stackoverflow.com/questions/33181356/connect-four-game-checking-for-wins-js) snippet, which I modified and then translated into Ruby.  Testing was added with Rspec.

Next steps: This project had a day-long time limit. If not restricted by time, I'd add messaging in to warn users when they were clicking an unavailable cell and other styling to and instructions to make the project more engaging.

[Live version](https://still-bayou-11896.herokuapp.com/)

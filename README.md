# SharpNotes 
![sharp_notes_logo](app/assets/images/old-note-transparent.png)

<img src="./old-note-transparent.png" width="48" height="24" />

[![HitCount](http://hits.dwyl.com/{username}/https://githubcom/reymillenium/sharpspring_coding_challenge.svg)](http://hits.dwyl.com/{username}/https://githubcom/reymillenium/sharpspring_coding_challenge)

## Ruby version
2.7.0

## System dependencies
- Rails 6.0.3.2
- PostgreSQL 11.6
- Node.js 12.16.2

## Configuration

Configuration is managed by [Figaro](https://github.com/laserlemon/figaro). Copy basic configuration blueprint using `$ cp config/application.yml_example config/application.yml` and contact any team member for any sensitive credentials needed.

## Database creation


You need to run it each time when developing the app. Second of all - to have node and ruby dependencies installed, use:

```
$ bundle && yarn
```

## Database initialization

```
$ bundle exec rake db:create
```

## How to run the test suite

```
$ rake db:test:prepare
$ bundle exec rspec
```

## Production Deployment instructions

Deployment is fully managed by [Heroku](https://www.heroku.com/).
After any change on the code is necessary to execute on the terminal:
```
$ git push heroku
```
- That will update the [production](https://sharp-notes.herokuapp.com/) release.

***

## Screen Shots

### Login page
![Example screenshot](./app/assets/images/screenshots/devise/login.png)

### Sign Up form
![Example screenshot](./app/assets/images/screenshots/devise/create_account_form.png)

### Pass recovery form
![Example screenshot](./app/assets/images/screenshots/devise/password_recovery_form.png)

### Resend confirmation email form
![Example screenshot](app/assets/images/screenshots/devise/resend_confirmation_email_form.png)

### Edit account form
![Example screenshot](app/assets/images/screenshots/devise/edit_account_form.png)

### Notes index page
![Example screenshot](app/assets/images/screenshots/notes/notes_index_page.png)

### New Note page
![Example screenshot](app/assets/images/screenshots/notes/new_note_page.png)

### About page
![Example screenshot](app/assets/images/screenshots/about_page.png)

***
## Contact
Created by [Reinier Garcia](https://www.reiniergarcia.com/) - feel free to contact me!




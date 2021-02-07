![ReyMillenium Banner](https://github.com/reymillenium/images/blob/master/reymillenium_banner_800x200.png)

# SharpNotes <img src="https://raw.githubusercontent.com/reymillenium/sharpspring_coding_challenge/master/app/assets/images/old-note-transparent.png" width="48" />
[![HitCount](http://hits.dwyl.com/{username}/https://githubcom/reymillenium/sharpspring_coding_challenge.svg)](http://hits.dwyl.com/{username}/https://githubcom/reymillenium/sharpspring_coding_challenge)

This is SharpNotes, a simple Ruby on Rails coding exercise. A sample website for recruiters, managers and potential clients. This covers local setup, dependencies and development flow.

## Ruby version
2.7.0

## System dependencies
- Rails 6.0.3.2
- PostgreSQL 11.6
- Node.js 12.16.2

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

## Deployment

The present project has being deployed to [Heroku](https://sharp-notes.herokuapp.com/).

***
## Contact
Created by [Reinier Garcia](https://reiniergarcia.dev/) - feel free to contact me!




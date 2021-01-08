# Private events

## Summary

### Objectives

- Construct a bi-directional has many through.
- Query for associations via the belongs_to, has_many, and has_many through
  associations.
- Iterate over associations in a view and display associated data for a primary
  instance.
- Identify the join model in a has many through.

![screenshot](screenshot.png)

![screenshot](screenshot1.png)

### Project created for learning purposes, covering the basics of Ruby on Rails including, but not limited to

- Models, Views, and Controllers (MVC)
- Data Structures & Relationships
- Routing
- Migrations
- Views with forms, partials, and helpers
- RESTful design
- Adding gems for extra features
- Authentication
- InApp email sending
- Data storage at external source (Amazon AWS bucket)
- Active Storage usage (Images uploading)
- Multiple level data models associations and relationships

## Getting Started

- This app is functional micro post blog with the possibility to create,read and
  delete posts (Admin only has access to delete). To access full functionality,
  the user should log in, if an account exists, or create one as a new user
  through email authentication process. The app is connected to the database
  accordingly, Amazon bucket used as external storage.

  - This application includes examples of all the major features of Rails,
    including models, views, controllers, templates, partials, filters,
    validations, callbacks, has_many/belongs_to and has_many :through
    associations, security, testing, and deployment.

  [Live Demo Link](https://my-meetings-app.herokuapp.com/)

## On your Computer

To get a local copy up and running follow these simple example steps.

## Prerequisites

- Any PC or device with an internet connection and ability to use the command
  line terminal

## Setup

- Open the command line terminal

## Install

- Go to your preferred directory
- Run `git clone https://github.com/Igors78/Post-Blog-Service.git` command
- Install Rails with all dependencies in order to run local server and app in
  it:
- `install Rails`
- `bundle install`
- `rails db:migrate`

## Usage

- Go to respective directory and run
- `rails server`
- Open LOCALHOST:3000 in your browser

## Built with

- Ruby 2.7.0
- Ruby on Rails 6.0.3.4
- Bootstrap
- Gems used listed in Gemfile

## Author

👤 **Igors Oleinikovs**

- GitHub: [Igors78](https://github.com/Igors78)
- Twitter: [@oleinikovs](https://twitter.com/oleinikovs)
- LinkedIn:
  [Oleinikovs Igors](https://www.linkedin.com/in/igors-oleinikovs-17a10958/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Ruby documentation
- [Ruby Guides](https://www.rubyguides.com/)
- [Michael Hartl](https://www.michaelhartl.com/)

## 📝 License

This project is [UNLicense](./LICENSE) licensed.

# URL Manager

URL Manager is a user-friendly Ruby on Rails application that allows you to create and manage shortened URLs for effective sharing. It provides a seamless experience for users to register, authenticate, and generate unique short codes for their URLs.

![app-demo][img]

### Features

-   User registration and authentication.
-   Creation of shortened URLs.
-   User-friendly interface for creating and managing shortened URLs.

### Tools used

-   Ruby on Rails
-   PostgreSQL
-   Docker

### Usage

-   Register or log in to create and manage shortened URLs.
-   On the homepage, enter the original URL you want to shorten and submit the form.
-   The application will generate a unique short code for the URL.
-   Share the shortened URL with others for easy access to the original URL.

### Installation and Setup

1. Clone the Repository
2. Create .env file and add variables.
3. Build `docker compose build`
4. Start the application `docker compose up`
5. Setup database `docker compose exec app bundle exec rake db:create db:migrate`
6. Done! Now the application can be accessed at http://localhost:3000

### Upcoming features

-   Customize URL
-   Set URL Expiration

[img]: https://res.cloudinary.com/dmtacem5p/image/upload/v1694331769/github/ruby-url-manager_gif.gif

# Activities Tracker (ClockRoR)

> This project consists in an app that tracks your activities. Each activity is specified with a starting and ending datetime, they also can be included in groups.

![screenshot](./app/assets/images/app_screenshot.png)

## Built With

- Ruby >= 2.6.5
- Rails >= 6.0.3
- Postgres >= 9.5
- Bootstrap >= 3
- Javascript


## Live Demo

[Live Demo Link](https://whispering-retreat-92662.herokuapp.com)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Setup

Clone or download the repo:

```
$ git clone git@github.com:abdelp/ror-capstone.git
```

### Install

```
$ cd ror-capstone
$ bundle
$ rails db:create
$ rails db:migrate
```

### Usage

Inside the root folder run:

```
rails s
```

#### Login

![login](./app/assets/images/login.png)

#### Register

![register](./app/assets/images/register.png)

#### Profile

![profile](./app/assets/images/profile.png)

#### Time entries

![time_entries](./app/assets/images/time_entries.png)

### Run tests

1. To run the tests where an image upload it's available you need to put an image "profile.png" in your /tmp folder.
2. The tests with selenium requires the previous installation of [chromium chrome driver](https://chromedriver.chromium.org/downloads) compatible with the chrome browser to use.
3. Run the tests with:

```
rspec
```

### Deployment

To deploy on Heroku

```
$ heroku create
$ git push heroku master
```

## Authors

👤 **Abdel Perez**

- Github: [@abdelp](https://github.com/abdelp)
- Twitter: [@AbdelPerez11](https://twitter.com/AbdelPerez11)
- Linkedin: [linkedin](https://www.linkedin.com/in/abdel-perez)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](lic.url) licensed.

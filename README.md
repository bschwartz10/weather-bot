# Weather Bot

## Overview
Weather Bot is a slack-bot that informs you of the weather! It uses the [DarkSky](https://darksky.net/dev/docs#forecast-request) API to retrieve weather information. Weather Bot responds to three different commands:
1. Weather now - Returns the current weather
2. Weather tomorrow - Returns the forecasted weather for tomorrow
3. Weekly forecast - Returns a summary of the weekly forecast

### Dependencies
 - This apps dependencies are listed in the Gemfile
 - This app is built on top of the [slack-ruby-bot](https://github.com/slack-ruby/slack-ruby-bot) gem

### Tests
- This app uses Rspec as its testing framework
- Run all tests using the `rspec` command

### Prerequisites
1. Create your [Slack bot](https://api.slack.com/slack-apps#creating_apps)
2. Register for your [DarkSky](https://darksky.net/dev) API

### How to setup in development
1. Clone this repo
2. `cd` into the project root
3. `bundle install`
4. Add a `.env` file to your project root and populate it with your Slack Bot and Dark Sky credentials. Here's mine w/ fake values.

```bash
SLACK_API_TOKEN=werd-146732457642-345678345232-FCV4BsdfE1BBBBrFfsVdBXe3
DARK_SKY_API_TOKEN=4fdq1234f3df456789ytrewq3bg5fd54
```
5. Run `foreman start` to start the server
6. Invite your slack-bot to your desired group using the `/invite` command
7. Type in any of the three commands listed in the overview section and receive the weather!

### Discussion
This app is organized into two main sections.
1. Commands
  - Holds the methods for the commands the app responds to
2. Services
  - Encompasses all the logic dealing with the DarkSky API

I closely followed the organization structure that was utilized in the [slack-ruby-bot tutorial](https://github.com/slack-ruby/slack-ruby-bot/blob/master/TUTORIAL.md). I did my best to encapsulate the API logic by creating a DarkSkyService class. I then used the 'command' method given to me by SlackRubyBot::Commands::Base to preform the Real Time Messaging feature of the application.

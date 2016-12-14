# Middleman x Semantic-UI

For generating static sites using Semantic's CSS framework.

## Steps to get started

```
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.1
git clone https://github.com/jhowtan/semantic-middleman.git
gem install middleman
cd semantic-middleman
bundle install
bundle exec middleman server
```

## Developing

All work happens in the `source` folder

### Javascript

Javascript files go into `source/javascripts`

### CSS

CSS files go into `source/stylesheets`

### HTML/ERB

Templating language is ERB, which is basically HTML but with Ruby stuff.

## Middleman

Anything that is unclear can be found on:

- http://semantic-ui.com/introduction/getting-started.html
- https://middlemanapp.com/basics/development_cycle/

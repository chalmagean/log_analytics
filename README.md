# Web log analytics

a. Receives a log as argument (webserver.log is provided)
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > list of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > list of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...

## Usage

```
$ ruby -Ilib bin/log_analytics spec/fixtures/webserver.log

Unique views
/help_page/1 23 unique views
/contact 23 unique views
/home 23 unique views
/index 23 unique views
/about/2 22 unique views
/about 21 unique views

Visits count
/about/2 180 visits
/contact 178 visits
/index 164 visits
/about 162 visits
/help_page/1 160 visits
/home 156 visits
```

## Tests

```
rspec
```

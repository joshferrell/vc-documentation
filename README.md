# Voice Computer Documentation
[![Build Status](https://travis-ci.org/voice-computer/vc-documentation.svg?branch=master)](https://travis-ci.org/voice-computer/vc-documentation)
[![Uptime Robot status](https://img.shields.io/uptimerobot/status/m778918918-3e92c097147760ee39d02d36.svg)](https://stats.uptimerobot.com/XQVmRtZzL)

Knowledge base for support documentation for voice computer.

### Installation

1. Install dependencies: `npm install`
2. Start application: `npm start`
3. Go to  [http://127.0.0.1:4444](http://127.0.0.1:4444) in your browser

Running the application in Production using minified code can be done by:

1. Create the minified/ugly files: `npm run uglify`
2. Ensure the minified/ugly files are being used: `NODE_ENV=production node app.js`

### Features

- **Search**: openKB is a search based Knowledge base (FAQ) backed by [Lunr.js](https://github.com/olivernn/lunr.js/) indexing to create the best possible results on searches.
- **Backend**: openKB uses the pure Javascript [nedb](https://github.com/louischatriot/nedb) embedded database by default or a MongoDB server.
- **Design/Themes**: openKB is meant to be simple flat design. Themes can be added by creating a theme folder within `public/themes/`. See the example theme for more information.
- **Responsive**: openKB is built using Bootstrap allowing it to be responsive and work on all devices. The `admin` can be a little difficult editing Markdown on smaller screens.
- **Mermaid**: openKB allows for [Mermaid](http://knsv.github.io/mermaid/) charts in articles.
- **Editor**: openKB uses Markdown-it which is based off the [CommonMark spec](http://spec.commonmark.org/). This allows for the very best Markdown experience.
- **Image management**: openKB allows for drag and drop of images into articles. The image is automatically uploaded to the server in the background. Google Chrome users can also paste images directly from the clipboard.

### Admin

Visit: [http://127.0.0.1:4444/login](http://127.0.0.1:4444/login)

A new user form will be shown where a user can be created.

**Data sorting**
You can control the sort order or articles. You can sort on anything but popular fields are `kb_viewcount`,  `kb_published_date`,  `kb_last_updated` or `kb_votes`

Setting the `sort_by` field in the `config.json` like so:

``` javascript
{field: 'kb_viewcount', order: -1};
```

Valid `order` values are: `-1` or `1`

`1` = ascending order

`-1` = decending order


### Migrating from NeDB to MongoDB (experimental)

You can upgrade from NeDB to Mongodb by running the following command:

Note: You will first need to setup a valid MongoDB connection as per the "Database setup" instructions.

```
npm run-script dbUpgrade
```

**please raise a Github issue if errors are encountered**

### Typeahead search

The typeahead search is great! Your user types in the word or phrase and the results pop up under the search box. But... One of the things to consider is that
there is a little more data being transmitted from server to browser to enable this functionality. This is not normally a big issue for most browsers
as the data is cached but you **may** run into issues if the number of articles in your app is quite large.

As a general rule there is about 3KB of compressed data being transferred from server to browser for 20 articles with long titles and keywords. If you have
hundreds of articles, the amount of data will increase and could cause performance issues. It is something to consider if your app seems to slow down once the
article numbers increase. If this is the case, you can simply just turn it off.

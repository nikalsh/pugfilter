# PugFilter

World chat pug filter addon for World of Warcraft 1.12.1.

The purpose of this addon is to filter out LFM messages from World chat. It doesn't remove any message but copies and outputs any messages containing "LF" and at least one word from a customizable list of keywords into the default chat frame. This makes it easy to parse whatever pug groups you're interested in joining when the World chat is moving fast. 

You will see the messages in the default chat frame even if World chat is disabled.

## Usage
```
/pugfilter add <keyword> - add keyword
/pugfilter remove <keyword> - remove keyword
/pugfilter list - list current keywords
/pugfilter toggle - toggles PugFilter on/off
/pugfilter reset - resets all settings
/pugfilter status - displays current status of PugFilter
```

Keywords are case-insensitive and the default keywords are the following:
```
kara
mc
zg
aq20
ubrs
ony
```

---
layout: page
title: Liége
---

[Liége](https://github.com/belgianman/liege) is the Wafelijzer theme used on the [Belgian Man Records](http://belgianman.com) website.

You can find the theme files in the [build](https://github.com/belgianman/liege/tree/master/build) folder.

## Development

You can use Liége as a template for building your own Wafelijzer theme.

Add files to the `css/`, `js/`, or `stylus/` directories, then run `npm install` and `grunt` to combine and compress all the files together.

You'll find your compressed files in `build/`: `css.min.css` and `js.min.js`.

### Stylus

Liége uses [Stylus](http://learnboost.github.io/stylus/) for CSS templating. Stylus files in `stylus/` are compiled to `css/stylus.css`, then combined and compressed with the rest of your CSS files.

# Rack::Custom404

Serve a 404 page from your Rack app. You could use this to serve a 404 page from
Middleman, for example, since Middleman [hard codes] their 404 response. Of
course, for Middleman you really shouldn't be serving the Middleman app, you
should build your content into static files and use the [solution here].

[hard codes]: https://github.com/middleman/middleman/blob/eede4a8c5d98978045e6bb819b50a85995434851/middleman-core/lib/middleman-core/core_extensions/request.rb#L283-L285
[solution here]: https://github.com/indirect/middleman-heroku-static-app

## Usage

Copy `lib/rack-custom_404.rb` into your app. Then in your `config.ru`:

```ruby
# config.ru
require "path/to/rack-custom_404.rb"

my_404_page_content = File.read("./404.html")
# Or maybe your 404 is in Haml, Erb, etc. You could render it with Tilt for a
# quick-and-dirty solution:
# my_404_page_content = Tilt.new("./404.html.haml").render

use Rack::Custom404, my_404_page_content

run my_app
```

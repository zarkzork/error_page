ErrorPage middleware
====================

This middleware allows you to show custom error page to all 500..599
response codes and to all exceptions.

It uses tilt to render templates, so supports all major temlating systems.

Usage
=====

In your rackup file include:

```ruby
use ErrorPage do
  # code that compiles your page or simply returns string message.
  haml :code
end
```

Options
=======

You can pass some options to ErrorPage block, for example

```ruby
use ErrorPage do
  set :path, 'app/views'
  set :render_layout, false
  haml :code
end
```

Possible options:

- @:path@
- @:render_layout@
- @:layout@

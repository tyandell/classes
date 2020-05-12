# classes

![Tests](https://github.com/tyandell/classes/workflows/Tests/badge.svg)

classes is a Ruby gem that lets you do:

```erb
<div class="<%= classes("notification", "is-danger": alert, "is-info": notice) %>">
  <%= alert || notice %>
</div>
```

It was inspired by the [Classnames](https://github.com/JedWatson/classnames) npm package.

## Install

```sh
bundle add classes
```

### Rails

Just start using `classes` in your views!

### Sinatra

First, `require` classes:

```ruby
require "classes"
```

For classic Sinatra apps, you're done.

For modular Sinatra apps, you'll also need to include the helpers:

```ruby
class App < Sinatra::Base
  helpers Classes::Helpers
end
```

Now you can start using `classes` in your views!

## Use

The simplest use for classes is to join some strings together:

```ruby
classes("button", "is-link").to_s # => "button is-link"
```

A hash makes it easy to conditionally enable classes:

```ruby
classes("button", "is-link": true, "is-danger": false).to_s # => "button is-link"
```

classes flattens and de-dupes your classes:

```ruby
classes(["button", ["button is-link", ["is-link"]]]).to_s # => "button is-link"
```

You can combine these features as much as you like:

```ruby
classes(
  :button, # Symbols are converted to strings.
  "is-link is-light",
  { "is-link": true, "is-danger": false },
  [true && "is-link", false && "is-danger"],
  "is-light",
  classes("is-fullwidth": true), # You can nest Classes::ClassList instances.
  " " # Empty or invalid classes are ignored.
).to_s # => "button is-link is-light is-fullwidth"
```

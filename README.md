noteable
========

Test plugin that adds has_many, polymorphic notes to models.

## Installation

1. Install as a gem in your Gemfile, then `bundle install`:

  `gem 'noteable', :git => 'git://github.com/yomike05/noteable.git'`

2. Generate and run the migration

    ```bash
    rake noteable:install:migrations  
    rake db:migrate
    ```

## Enabling Notes

  Add `is_noteable` to any model that you want to add notes to.
  
```ruby
class Product < ActiveRecord:Base  
  is_noteable  
  # ...  
end
```

  Every note has these attributes:

```ruby 
note.item # parent
note.item_id # parent instance id
note.item_type # parent class name
note.body # the note
note.author # author's name
note.created_at # creation timestamp
```

  Create a note as normal:

```ruby
@myproduct = MyProduct.find 17
@myproduct.notes.create :body => "I've seen everything.", :author => "Ned"
```

## Mounting Noteable
Noteable comes with basic controller actions and views that can be mounted as follows in application/config/routes.rb:

```ruby
DummyApp::Application.routes.draw do
  resources :products do
    mount Noteable::Engine, :at => "notes"
  end
end
```
`http://localhost:3000/products/1/notes` will show the notes for the instance of Product where id=1.
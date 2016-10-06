
Try it at https://serene-shelf-42005.herokuapp.com/admin

## Taxonomy-style hierarchies
See https://serene-shelf-42005.herokuapp.com/admin/issue/nestable

## Revision history
See, for example, https://serene-shelf-42005.herokuapp.com/admin/blog_post/history. With login/logout configured if will associate changes with the logged in user.

## Access control
rails_admin integrates with a couple different rails authentication and access management gems - limiting access by model or field looks pretty straightforward.

## Importing content
rails_admin_import (https://github.com/stephskardal/rails_admin_import) was probably the coolest plugin I tried. Importing the issues taxonomy and associating the terms with the right blogs posts via a many-to-many relationship was easy.

## UI configuration
The admin UI was pretty easy to configure and seems quite flexible. I think the default multi-select widget is clunky, but it doesn't looks too hard to swap it out for something better.

## User-facing pages
Non-admin pages work like plain old rails - get the content in a controller and template it in views.

## Internationalization
I didn't have time to try this out, but the globalize gem (https://github.com/globalize/globalize) looks promising. It has an interesting integration with the rails_admin gem: https://github.com/scarfaceDeb/rails_admin_globalize_field

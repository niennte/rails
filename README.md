

# controller
$ rails generate controller Site home
Running via Spring preloader in process 49852
      create  app/controllers/site_controller.rb
       route  get 'site/home'
      invoke  erb
      create    app/views/site
      create    app/views/site/home.html.erb
      invoke  test_unit
      create    test/controllers/site_controller_test.rb
      invoke  helper
      create    app/helpers/site_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/site.coffee
      invoke    scss
      create      app/assets/stylesheets/site.scss


$ rails server
      http://0.0.0.0:3000/site/home


# model
$ rails generate model Post title:string body:text
Running via Spring preloader in process 58193
      invoke  active_record
      create    db/migrate/20180628231412_create_posts.rb
      create    app/models/post.rb
      invoke    test_unit
      create      test/models/post_test.rb
      create      test/fixtures/posts.yml


$ rails db:migrate
== 20180628231412 CreatePosts: migrating ======================================
-- create_table(:posts)
   -> 0.0010s
== 20180628231412 CreatePosts: migrated (0.0011s) =============================



# routes, controller and and views
$ rails routes
                   Prefix Verb   URI Pattern                                                                              Controller#Action
                site_home GET    /site/home(.:format)                                                                     site#home
                    posts GET    /posts(.:format)                                                                         posts#index
                          POST   /posts(.:format)                                                                         posts#create
                 new_post GET    /posts/new(.:format)                                                                     posts#new
                edit_post GET    /posts/:id/edit(.:format)                                                                posts#edit
                     post GET    /posts/:id(.:format)                                                                     posts#show
                          PATCH  /posts/:id(.:format)                                                                     posts#update
                          PUT    /posts/:id(.:format)                                                                     posts#update
                          DELETE /posts/:id(.:format)                                                                     posts#destroy
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)

$ rails generate scaffold_controller Post
Running via Spring preloader in process 58722
      create  app/controllers/posts_controller.rb
      invoke  erb
      create    app/views/posts
      create    app/views/posts/index.html.erb
      create    app/views/posts/edit.html.erb
      create    app/views/posts/show.html.erb
      create    app/views/posts/new.html.erb
      create    app/views/posts/_form.html.erb
      invoke  test_unit
      create    test/controllers/posts_controller_test.rb
      create    test/system/posts_test.rb
      invoke  helper
      create    app/helpers/posts_helper.rb
      invoke    test_unit
      invoke  jbuilder
      create    app/views/posts/index.json.jbuilder
      create    app/views/posts/show.json.jbuilder
      create    app/views/posts/_post.json.jbuilder


# dummy records
- boots up in an IRB session
syntax:
Model.create attribute: "content goes here...", another_attribute: "more content..."

$ rails console
Running via Spring preloader in process 58770
Loading development environment (Rails 5.2.0)
irb(main):001:0> Post.create title: "My first post, be nice", body: "I'm not sure what to write here..."
   (0.1ms)  begin transaction
  Post Create (33.8ms)  INSERT INTO "posts" ("title", "body", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["title", "My first post, be nice"], ["body", "I'm not sure what to write here..."], ["created_at", "2018-06-29 00:16:37.265773"], ["updated_at", "2018-06-29 00:16:37.265773"]]
   (173.5ms)  commit transaction
=> #<Post id: 1, title: "My first post, be nice", body: "I'm not sure what to write here...", created_at: "2018-06-29 00:16:37", updated_at: "2018-06-29 00:16:37">
irb(main):002:0>


$ rails server
      http://localhost:3000/posts


reference:
http://guides.rubyonrails.org/command_line.html

rails dbconsole figures out which database you're using and drops you into whichever command line interface you would use with it (and figures out the command line parameters to give to it, too!). It supports MySQL (including MariaDB), PostgreSQL and SQLite3.


$ rails dbconsole
SQLite version 3.6.3
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite>
sqlite> select * from posts;
1|My first post, be nice|I'm not sure what to write here...|2018-06-29 00:16:37.265773|2018-06-29 00:16:37.265773
2|My second post|Getting better at this now, hold on...|2018-06-29 02:37:51.481544|2018-06-29 02:37:51.481544
3|A third post|Ok, I'm still not sure what to write|2018-06-29 02:38:09.188096|2018-06-29 02:38:09.188096
sqlite>
sqlite>

- - -
SQLite:
Ctl + D = quit
.tables = show tables


$ rails console
Running via Spring preloader in process 59942
Loading development environment (Rails 5.2.0)
irb(main):001:0>
irb(main):002:0> Post.all
  Post Load (4.5ms)  SELECT  "posts".* FROM "posts" LIMIT ?  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<Post id: 1, title: "My first post, be nice", body: "I'm not sure what to write here...", created_at: "2018-06-29 00:16:37", updated_at: "2018-06-29 00:16:37">, #<Post id: 2, title: "My second post", body: "Getting better at this now, hold on...", created_at: "2018-06-29 02:37:51", updated_at: "2018-06-29 02:37:51">, #<Post id: 3, title: "A third post", body: "Ok, I'm still not sure what to write", created_at: "2018-06-29 02:38:09", updated_at: "2018-06-29 02:38:09">]>
irb(main):003:0>
irb(main):004:0>




(all gets executed)


irb(main):006:0>
irb(main):007:0> posts = Post.all; posts.to_sql
=> "SELECT \"posts\".* FROM \"posts\""
irb(main):008:0>
irb(main):009:0>

# or:

irb(main):012:0> Post.all.to_sql
=> "SELECT \"posts\".* FROM \"posts\""
irb(main):013:0>



--- ActiveRecord Qurying docs:
http://guides.rubyonrails.org/active_record_querying.html


Person
  .select('people.id, people.name, comments.text')
  .joins(:comments)
  .where('comments.created_at > ?', 1.week.ago)

  * note: :commetns -- means string literal with no String functionality attached, just a special case with no class or object



# CSS and JS

app/assets/stylesheets/application.css # includes SASS


any style appearaing in

app/assets/stylesheets/

gets loaded (generated by stylesheet_link_tag).

- in dev loads separately
- in prod loads optimize

called with

stylesheet_link_tag  . # path


# Photos using Paperclip gem
(deprecated in favor of Rails' ActiveStorage)


$ brew install imagemagick

$ which convert
/usr/local/bin/convert

- add the gem to Gemfile

$ bundle

$ which file
/usr/bin/file

- add field and validation to model

$ rails generate paperclip post photo
Running via Spring preloader in process 64829
      create  db/migrate/20180629171446_add_attachment_photo_to_posts.rb

$ rails db:migrate
== 20180629171446 AddAttachmentPhotoToPosts: migrating ========================
-- change_table(:posts)
   -> 0.0547s
== 20180629171446 AddAttachmentPhotoToPosts: migrated (0.0548s) ===============


$ rails db
SQLite version 3.6.3
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> .tables;
unknown command or invalid arguments:  "tables;". Enter ".help" for help
sqlite>
sqlite>
sqlite> .tables
ar_internal_metadata  posts                 schema_migrations
sqlite>
sqlite> .schema posts
CREATE TABLE "posts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "body" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "photo_file_name" varchar, "photo_content_type" varchar, "photo_file_size" integer, "photo_updated_at" datetime);

- restart the server


- add white list filters in controller
- add image tag and upload to the views

- after restarting the server, added photos to posts

(see server logs for details, eg)

Started PATCH "/posts/4" for 127.0.0.1 at 2018-06-29 13:37:41 -0400
Processing by PostsController#update as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"fUGtROdxO0Zaf+2aKMP01ed7A5gmvXlenaAvKr8SV7eSmGatGHNUB+c1XS8+wNh9h6BoPEj7vccOJ1cWsIsmIQ==", "post"=>{"title"=>"Fourth post", "body"=>"Still as unclear what to write as before", "photo"=>#<ActionDispatch::Http::UploadedFile:0x00007f9aa9953530 @tempfile=#<Tempfile:/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/RackMultipart20180629-64896-1lvm0l7.JPG>, @original_filename="DSCN6453.JPG", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"post[photo]\"; filename=\"DSCN6453.JPG\"\r\nContent-Type: image/jpeg\r\n">}, "commit"=>"Update Post", "id"=>"4"}
  Post Load (0.2ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = ? LIMIT ?  [["id", 4], ["LIMIT", 1]]
  ↳ app/controllers/posts_controller.rb:67
   (0.1ms)  begin transaction
  ↳ app/controllers/posts_controller.rb:44
[paperclip] Trying to link /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/RackMultipart20180629-64896-1lvm0l7.JPG to /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG
[paperclip] Trying to link /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG to /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-4bjdfn.JPG
Command :: file -b --mime '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-4bjdfn.JPG'
Command :: identify -format '%wx%h,%[exif:orientation]' '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG[0]' 2>/dev/null
Command :: identify -format %m '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG[0]'
Command :: convert '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG[0]' -auto-orient -resize "300x300>" '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/0ffdebf05fe487f149a1d22f127368a620180629-64896-1064lsk'
[paperclip] Trying to link /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/0ffdebf05fe487f149a1d22f127368a620180629-64896-1064lsk to /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/ee9da5e4fc5c4e74a8e80c2a11857d4520180629-64896-1jkdn4n
Command :: identify -format '%wx%h,%[exif:orientation]' '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG[0]' 2>/dev/null
Command :: identify -format %m '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG[0]'
Command :: convert '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG[0]' -auto-orient -resize "100x100>" '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/0ffdebf05fe487f149a1d22f127368a620180629-64896-gjwqea'
[paperclip] Trying to link /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/0ffdebf05fe487f149a1d22f127368a620180629-64896-gjwqea to /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/7724862527e3a47877557b44a0d2b36420180629-64896-7eubt8
[paperclip] Trying to link /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-1itdsjn.JPG to /var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-yyp9v5.JPG
Command :: file -b --mime '/var/folders/t3/lfd6kxln3258q1j_5djzdmnh0000gn/T/4d90bb849a9ec9731d77229333cdf5c120180629-64896-yyp9v5.JPG'
  Post Update (0.5ms)  UPDATE "posts" SET "photo_file_name" = ?, "photo_content_type" = ?, "photo_file_size" = ?, "photo_updated_at" = ?, "updated_at" = ? WHERE "posts"."id" = ?  [["photo_file_name", "DSCN6453.JPG"], ["photo_content_type", "image/jpeg"], ["photo_file_size", 2096410], ["photo_updated_at", "2018-06-29 17:37:41.329595"], ["updated_at", "2018-06-29 17:37:44.955782"], ["id", 4]]
  ↳ app/controllers/posts_controller.rb:44
   (1.9ms)  commit transaction
  ↳ app/controllers/posts_controller.rb:44
Redirected to http://localhost:3000/posts/4
Completed 302 Found in 3736ms (ActiveRecord: 2.6ms)



- - -

## auth
- encryption for passwords:
- bcrypt gem -
	irreversible hash for passwords
	salt (against rainbow tables)

rails generate migration add_password_digest_to_users password_digest: string


$ rails generate migration add_password_digest_to_users password_digest:string
Running via Spring preloader in process 66409
      invoke  active_record
      create    db/migrate/20180629191122_add_password_digest_to_users.rb


- in the model:
ActiveRecord::Base.has_secure_password

- automatically stores password as password hashed digest in the db
- create attributes like password and password confirmation that can be used to log in
- creates a method called authenticate

* - doesn't need any arguments, assumes the db column is called password_digest


- run the migration

- uncomment brypt gem in the Gemfile
- run bundle

$ rails bundle
...
Bundle complete! 20 Gemfile dependencies, 84 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

- restart server

- update views (create, update) - via the form
	add password and password confirmation

- add password field to the controller white list


## enable user login
- HTTP requests don't trace themselves
- cookies to establish sessions

- add sessions controller (no scaffold)

$ rails generate controller Sessions new
Running via Spring preloader in process 66687
      create  app/controllers/sessions_controller.rb
       route  get 'sessions/new'
      invoke  erb
      create    app/views/sessions
      create    app/views/sessions/new.html.erb
      invoke  test_unit
      create    test/controllers/sessions_controller_test.rb
      invoke  helper
      create    app/helpers/sessions_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/sessions.coffee
      invoke    scss
      create      app/assets/stylesheets/sessions.scss

- add routes for session

config/routes.rb
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

- refine session controller

- add current_user method to application_controller (abstract class)


* note:
by default, session helper method uses encrypted cookie
to make session readable in browser, use controller method cookie instead

* !! Rails cookies: https://www.justinweiss.com/articles/how-rails-sessions-work/
Rails has no native session management.

	- default behavior relies on encrypted cookies
	- session done in this way needs to be slim!

reference:
CS Standford (generic)
https://web.stanford.edu/~ouster/cgi-bin/cs142-fall10/lecture.php?topic=cookie
rails sessions:
https://www.justinweiss.com/articles/how-rails-sessions-work/

* note: flash.now -- helper method to pass messages to forms

## set content ownership

	- ActiveRecord associations
		methods
			belongs_to
			has_many
	reference: http://guides.rubyonrails.org/association_basics.html



- add methods to related models

- add migration (add foreign key to posts)
$ rails generate migration AddUserToPosts user:belongs_to
Running via Spring preloader in process 67567
      invoke  active_record
      create    db/migrate/20180629212525_add_user_to_posts.rb


- run migration
$ rails db:migrate
== 20180629212525 AddUserToPosts: migrating ===================================
-- add_reference(:posts, :user, {:foreign_key=>true})
   -> 0.0138s
== 20180629212525 AddUserToPosts: migrated (0.0139s) ==========================


- add link to author to the post show view

- to avoid dev errors, destroy all posts from console

$ rails console
Running via Spring preloader in process 67861
Loading development environment (Rails 5.2.0)
irb(main):001:0>
irb(main):002:0> Post.all
  Post Load (1.9ms)  SELECT  "posts".* FROM "posts" LIMIT ?  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<Post id: 1, title: "My first post, be nice!", body: "I'm not sure what to write here!..", created_at: "2018-06-29 00:16:37", updated_at: "2018-06-29 17:55:46", photo_file_name: "DSCN5101.JPG", photo_content_type: "image/jpeg", photo_file_size: 2166684, photo_updated_at: "2018-06-29 17:55:40", user_id: nil>, #<Post id: 2, title: "My second post...", body: "Getting better at this now, hold on...", created_at: "2018-06-29 02:37:51", updated_at: "2018-06-29 17:56:07", photo_file_name: "DSCN5864.JPG", photo_content_type: "image/jpeg", photo_file_size: 3375923, photo_updated_at: "2018-06-29 17:56:01", user_id: nil>, #<Post id: 3, title: "A third post", body: "Ok, I'm still not sure what to write", created_at: "2018-06-29 02:38:09", updated_at: "2018-06-29 17:56:30", photo_file_name: "DSCN6410.jpg", photo_content_type: "image/jpeg", photo_file_size: 6294370, photo_updated_at: "2018-06-29 17:56:24", user_id: nil>, #<Post id: 4, title: "Fourth post", body: "Still as unclear what to write as before", created_at: "2018-06-29 16:06:34", updated_at: "2018-06-29 17:56:55", photo_file_name: "DSCN6453.JPG", photo_content_type: "image/jpeg", photo_file_size: 2096410, photo_updated_at: "2018-06-29 17:56:50", user_id: nil>]>
irb(main):003:0>
irb(main):004:0>
irb(main):005:0> Post.destroy_all
  Post Load (0.3ms)  SELECT "posts".* FROM "posts"
   (0.1ms)  begin transaction
  Post Destroy (1.8ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 1]]
   (1.6ms)  commit transaction
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/001/original/DSCN5101.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/001/large/DSCN5101.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/001/medium/DSCN5101.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/001/thumb/DSCN5101.JPG
   (0.1ms)  begin transaction
  Post Destroy (0.4ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 2]]
   (1.7ms)  commit transaction
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/002/original/DSCN5864.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/002/large/DSCN5864.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/002/medium/DSCN5864.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/002/thumb/DSCN5864.JPG
   (0.1ms)  begin transaction
  Post Destroy (0.4ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 3]]
   (1.7ms)  commit transaction
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/003/original/DSCN6410.jpg
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/003/large/DSCN6410.jpg
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/003/medium/DSCN6410.jpg
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/003/thumb/DSCN6410.jpg
   (0.1ms)  begin transaction
  Post Destroy (0.4ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 4]]
   (3.1ms)  commit transaction
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/004/original/DSCN6453.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/004/large/DSCN6453.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/004/medium/DSCN6453.JPG
[paperclip] deleting /Users/user/openclassrooms/project6/traveller/public/system/posts/photos/000/000/004/thumb/DSCN6453.JPG
=> [#<Post id: 1, title: "My first post, be nice!", body: "I'm not sure what to write here!..", created_at: "2018-06-29 00:16:37", updated_at: "2018-06-29 17:55:46", photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, user_id: nil>, #<Post id: 2, title: "My second post...", body: "Getting better at this now, hold on...", created_at: "2018-06-29 02:37:51", updated_at: "2018-06-29 17:56:07", photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, user_id: nil>, #<Post id: 3, title: "A third post", body: "Ok, I'm still not sure what to write", created_at: "2018-06-29 02:38:09", updated_at: "2018-06-29 17:56:30", photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, user_id: nil>, #<Post id: 4, title: "Fourth post", body: "Still as unclear what to write as before", created_at: "2018-06-29 16:06:34", updated_at: "2018-06-29 17:56:55", photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, user_id: nil>]
irb(main):006:0>
irb(main):007:0>
irb(main):008:0>


- adding posts now displays logged in user, if user not logged in, posts won't be created

- update views
	- update user view to display published posts
	- update posts index to display post author, and to restrict new, edit and destroy to logged in users

- set ownerships in controllers

- - -
- - -
Map!

	enable travellers to post to a map, and users, to discover posts on the map.


# Add backend geocoding functionality

- add geocoder gem
	(add to Gemfile)
	reference:
	http://www.rubygeocoder.com
	https://github.com/alexreisner/geocoder

$ vi Gemfile
...
+ gem 'geocoder'
...


- bundle
	$ rails bundle

$ rails bundle
...
Bundle complete! 21 Gemfile dependencies, 85 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
Post-install message from geocoder:


NOTE: Geocoder's default IP address lookup has changed from FreeGeoIP.net to IPInfo.io. If you explicitly specify :freegeoip in your configuration you must choose a different IP lookup before FreeGeoIP is discontinued on July 1, 2018. If you do not explicitly specify :freegeoip you do not need to change anything.

	#info
		$ bundle info geocoder
		  * geocoder (1.4.9)
			Summary: Complete geocoding solution for Ruby.
			Homepage: http://www.rubygeocoder.com
			Path: /Users/user/.rbenv/versions/2.5.0/lib/ruby/gems/2.5.0/gems/geocoder-1.4.9

- restart server if necessary


# usage in model
	locate posts by latitude and longitude

- create migration
	$ rails g migration add_address_longitude_and_latitude_to_posts address:string latitude:float longitude:float

	- g is shortcut for generate

$ rails g migration add_address_longitude_and_latitude_to_posts address:string latitude:float longitude:float
Running via Spring preloader in process 86787
      invoke  active_record
      create    db/migrate/20180702161550_add_address_longitude_and_latitude_to_posts.rb

- run migration
	$ rails db:migrate

$ rails db:migrate
== 20180702161550 AddAddressLongitudeAndLatitudeToPosts: migrating ============
-- add_column(:posts, :address, :string)
   -> 0.0017s
-- add_column(:posts, :latitude, :float)
   -> 0.0076s
-- add_column(:posts, :longitude, :float)
   -> 0.0005s
== 20180702161550 AddAddressLongitudeAndLatitudeToPosts: migrated (0.0426s) ===


	# info
	$ rails db
		SQLite version 3.6.3
		Enter ".help" for instructions
		Enter SQL statements terminated with a ";"
		sqlite> .schema posts
		CREATE TABLE "posts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "body" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "photo_file_name" varchar, "photo_content_type" varchar, "photo_file_size" integer, "photo_updated_at" datetime, "user_id" integer, "address" varchar, "latitude" float, "longitude" float);
		CREATE INDEX "index_posts_on_user_id" ON "posts" ("user_id");
		sqlite>


- in the post model, add geocode methods:
	geocoded_by :address

	* note: if: :address_changed?
		[field]_changed? - Rails model method


- in the post form, add address field

- in the posts controller, add whitelist permissions

- in the post show view, add text placeholder to display coordinates

	# now if full address added to post, will display coordinates
	# if address incomplete, it is saved but coordinates are not


## ??????? - experimenting with Mapbox as Mapzen services discontinued:

    - Trying https://www.mapbox.com/

    	reference: https://www.mapbox.com/mapbox-gl-js/api/

    	sign in creds:
    	arcenciel email
    	nnothing UN
    	the wise simple pw

    	access token:
    	pk.eyJ1Ijoibmllbm50ZSIsImEiOiJjamo0ajE5aDgxajJhM2twZzB4cWRxNXFzIn0.wrH52IDoERpZGasQNOjUXg

    	going through HTML route using CSDN (there is NPM bundle instructions too)

    	<script src='https://api.mapbox.com/mapbox-gl-js/v0.46.0/mapbox-gl.js'></script>
    	<link href='https://api.mapbox.com/mapbox-gl-js/v0.46.0/mapbox-gl.css' rel='stylesheet' />

    experimenting:
    add image to map:
    https://www.mapbox.com/mapbox-gl-js/example/add-image/

    examples:
    https://www.mapbox.com/mapbox-gl-js/example/popup-on-hover/

    add pop up:
    https://www.mapbox.com/mapbox-gl-js/example/popup-on-hover/

    - made haard coded test map, localized to the application layout and the site home view




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




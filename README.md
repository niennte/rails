

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


$ rails server
http://0.0.0.0:3000/site/home


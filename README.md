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


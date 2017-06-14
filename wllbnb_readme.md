WILLBNB PROJECT (AIRBNB PROJECT)

###Create Simple Project with Bootstrap
Fist of all, we need to install the Bootstrap gem to handle the grids where are stored on this framework.

<pre>
  subl /wllbnb/<b>Gemfile</b>
  <b>
  gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'
  gem 'sass-rails', '~> 5.0'
  </b>
</pre>

After that, run the **bundle command** to install those gems in our project on **terminal**:

<pre>
  bundle install
</pre>

After this step, **import** the Bootstrap JS and SCSS resources to run these features:

<pre>
  subl wllbnb/app/assets/javascripts/<b>application.js</b>
  <b>
  //= require jquery3
  //= require popper
  //= require bootstrap-sprockets
  </b>

  subl wllbnb/app/assets/stylesheets/<b>application.scss</b>
  <b>
   * require_tree .
   *= require_self
   */

  @import 'bootstrap';
  </b>
</pre>

Set the database fields and after run the command to create the database:

<pre>
  subl wllbnb/config/<b>database.yml</b>

  default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: root
  <b>password: 1234</b>
  host: localhost
</pre>

Create the database on **Terminal**:

<pre>
  rails <b>db:create</b>
</pre>

And now, run the server:

<pre>
  rails <b>server</b> or <b>s</b>
</pre>

###Create Basic Authentication

Open the gemfile and add the **Devise** features:

<pre>
  subl wllbnb/<b>Gemfile</b>
  
  <b>gem 'devise'</b>
</pre>

After that, run the **Devise** generator installer:

<pre>
  rails g <b>devise:install</b>

  Running via Spring preloader in process 74466
    create  config/initializers/devise.rb
    create  config/locales/devise.en.yml
  ===============================================================================

  Some setup you must do manually if you haven't yet:

    1. Ensure you have defined default url options in your environments files. Here
       is an example of default_url_options appropriate for a development environment
       in config/environments/development.rb:

         config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

       In production, :host should be set to the actual host of your application.

    2. Ensure you have defined root_url to *something* in your config/routes.rb.
       For example:

         root to: "home#index"

    3. Ensure you have flash messages in app/views/layouts/application.html.erb.
       For example:

         &lt;p class="notice"&gt;&lt;%= notice %&gt;&lt;/p&gt;
         &lt;p class="alert"&gt;&lt;%= alert %&gt;&lt;/p&gt;

    4. You can copy Devise views (for customization) to your app by running:

         rails g devise:views

  ===============================================================================  
</pre>

After that, run the **User Devise Model** with the next command in terminal:

<pre>
  rails g <b>devise User</b>

  Running via Spring preloader in process 74689
    invoke  active_record
    create    db/migrate/20170614023125_devise_create_users.rb
    create    app/models/user.rb
    invoke    test_unit
    create      test/models/user_test.rb
    create      test/fixtures/users.yml
    insert    app/models/user.rb
     route  devise_for :users
</pre>

And before to create the **User Devise Model**:

<pre>
  rails <b>db:migrate</b>

  == 20170614023125 DeviseCreateUsers: migrating ================================
  -- create_table(:users)
     -> 0.0185s
  -- add_index(:users, :email, {:unique=>true})
     -> 0.0291s
  -- add_index(:users, :reset_password_token, {:unique=>true})
     -> 0.0170s
  == 20170614023125 DeviseCreateUsers: migrated (0.0648s) =======================  
</pre>

Now, generate the devise views and this will create all the views and routes which will be used to the authenthication system:

<pre>
  rails <b>g devise:views</b>
</pre>

Later, set the **default URL** which will be used on the **Development Environment**:

<pre>
  <b>config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }</b>
</pre>

Now, set the **Flash Event** which will run the **Message Events**:

<pre>
  subl wllbnb/app/views/layouts/<b>application.html.erb</b>

  &lt;% flash.each do |key, value| %&gt;
    &lt;div class="alert alert-&lt;%= key %&gt; alert-dismissable top-login-bar"&gt;
      &lt;button type="button" class="close" data-dismiss="alert" aria-hidden="true"&gt;×&lt;/button&gt;
      &lt;%= value %&gt;
    &lt;/div&gt;
  &lt;% end %&gt;
</pre>

After run the application, set the **Next Helper** to handle the **Flash Messages**:

<pre>
  subl wllbnb/helpers/<b>application_helper.rb</b>

  module ApplicationHelper

    def flash_messages
      return if flash.empty?
      messages = flash.map do |key, value|
        if key == 'notice'
          content_tag(:div, value, class: 'success')
        elsif key == 'alert'
          content_tag(:div, value, class: 'error')
        end
      end
      safe_join(messages)
    end

  end
</pre>

Next, to check if everything works, run the run server command and go to the **Devise Routes**:

<pre>
  rails <b>s</b>

  And in the explorer:
  <b>localhost:3000/users/sign_up</b>
</pre>

###Building Navbar with Partial View

We will get the code from this example from [Bootstrap Navbar Static Top](https://getbootstrap.com/examples/navbar-static-top/) to handle the first view which will be used in the whole platform. Also, insert the **Yield Helper** into a **container div class** to insert any content inside of that block.

<pre>
&lt;nav class="navbar navbar-default navbar-static-top"&gt;
  &lt;div class="container"&gt;
    &lt;div class="navbar-header"&gt;
      &lt;button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"&gt;
        &lt;span class="sr-only"&gt;Toggle navigation&lt;/span&gt;
        &lt;span class="icon-bar"&gt;&lt;/span&gt;
        &lt;span class="icon-bar"&gt;&lt;/span&gt;
        &lt;span class="icon-bar"&gt;&lt;/span&gt;
      &lt;/button&gt;
      &lt;a class="navbar-brand" href="#"&gt;
        &lt;%= image_tag 'wllbnb-logo.svg', alt: 'wllbnb-logo', style:'height: auto; width: 40px;' %&gt;AirAlien
      &lt;/a&gt;
    &lt;/div&gt;
    &lt;div id="navbar" class="navbar-collapse collapse"&gt;
      &lt;ul class="nav navbar-nav navbar-right"&gt;
        
        &lt;% if(!user_signed_in?) %&gt;
          &lt;li&gt;&lt;%= link_to "Log In", new_user_session_path %&gt;&lt;/li&gt;
          &lt;li&gt;&lt;%= link_to "Sign Up", new_user_registration_path %&gt;&lt;/li&gt;
        &lt;% else %&gt;
          &lt;li class="dropdown"&gt;
            &lt;a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"&gt;&lt;%= current_user.email %&gt; &lt;span class="caret"&gt;&lt;/span&gt;&lt;/a&gt;

            &lt;ul class="dropdown-menu"&gt;
              &lt;li&gt;&lt;a href="#"&gt;Your Trips&lt;/a&gt;&lt;/li&gt;
              &lt;li&gt;&lt;a href="#"&gt;Wish Lists&lt;/a&gt;&lt;/li&gt;
              &lt;li&gt;&lt;%= link_to "Edit Profile", edit_user_registration_path %&gt;&lt;/li&gt;
              &lt;li role="separator" class="divider"&gt;&lt;/li&gt;
              &lt;li&gt;&lt;a href="#"&gt;Account Setting&lt;/a&gt;&lt;/li&gt;
              &lt;li&gt;&lt;%= link_to "Log out", destroy_user_session_path, method: :delete %&gt;&lt;/li&gt;
            &lt;/ul&gt;
          &lt;/li&gt;
        &lt;% end %&gt;
      &lt;/ul&gt;            
    &lt;/div&gt;&lt;!--/.nav-collapse --&gt;
  &lt;/div&gt;
&lt;/nav&gt;
&lt;div class="container"&gt;
  &lt;%= yield %&gt;
&lt;/div&gt;
</pre>

After this, we will create the **Pages Controller** to set the main static pages in terminal:

<pre>
  rails g <b>controller Pages homme</b>
  Running via Spring preloader in process 86155
    create  app/controllers/pages_controller.rb
     route  get 'pages/home'
    invoke  erb
    create    app/views/pages
    create    app/views/pages/home.html.erb
    invoke  test_unit
    create    test/controllers/pages_controller_test.rb
    invoke  helper
    create    app/helpers/pages_helper.rb
    invoke    test_unit
    invoke  assets
    invoke    coffee
    create      app/assets/javascripts/pages.coffee
    invoke    scss
    create      app/assets/stylesheets/pages.scss  
</pre>

Now insert 


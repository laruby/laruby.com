# LARuby.com

LARuby.com is a website built by and for the Los Angeles Ruby users' group.  Its purpose is both to
be a tool to promote and enhance LARuby and to be a project where LARuby members can work together
to learn to be better coders.

## LARuby.com is a collaborative effort of various Ruby Programmers in Los Angeles

* [Ron Evans](http://deadprogrammersociety.blogspot.com/ "Ron Evans")
* [Daniel Fischer](http://www.abigfisch.com "Daniel Fischer")
* [Brian Miller](http://twitter.com/brimil_01 "Brian Miller")
* [Alf Mikula](http://twitter.com/alfmikula "Alf Mikula")
* [John Dewey](http://twitter.com/retr0h "John Dewey")

## Getting Started

Getting started is easy:

1. Clone the code in github.

    $ git clone git://github.com/laruby/laruby.com.git

2. Install the Rails 2.3.3 gem if needed.

    $ sudo gem install -v 2.3.3 rails

3. Copy database.yml.init to database.yml.

    $ cp config/database.yml.init config/database.yml

4. Install the required gems.

    $ sudo rake gems:install

5. Create the database and load the schema.

    $ rake db:create db:schema:load

5. Run the specs.

    $ rake spec

At this point, you should get a successful test run that looks something like this:

    $ rake spec
    (in /Users/you/projects/laruby.com)
    ....................................................................

    Finished in 0.419873 seconds

    68 examples, 0 failures


    $ RAILS_ENV=test cucumber
    Feature: Home Page Links
      In order to navigate site
      As a user
      I want to see links

      Scenario: Top Navigation Links                            # features/home_page_links.feature:6
        Given I am on the homepage                              # features/step_definitions/webrat_steps.rb:6
        When I view the page, I should see "2" navigation links # features/step_definitions/page_link_steps.rb:2
        Then I should see the "Home" link                       # features/step_definitions/page_link_steps.rb:6
        And I should see the "About" link                       # features/step_definitions/page_link_steps.rb:6

    1 scenario (1 passed)
    4 steps (4 passed)
    0m0.306s

That's it, you're ready to go!  Contact us through the [laruby-codejam](http://groups.google.com/group/laruby-codejam) Google group or [#laruby](irc://irc.freenode.net/laruby] irc channel on freenode for more information.

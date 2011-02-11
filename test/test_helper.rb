require 'rubygems'

# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../../Gemfile', __FILE__)
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end

require 'test/unit'
require 'sqlite3'
require 'active_support'
require 'active_record'
require "uuidtools"
require File.join(File.dirname(__FILE__),'..','/lib','/uuid_extension')

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Migration.verbose = false

def setup_db
  ActiveRecord::Base.silence do
    ActiveRecord::Schema.define(:version => 1) do
      create_table :dummy_with_uuid_extensions do |t|
        t.integer :id
        t.string :foobar
      end
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

setup_db # Init the database for class creation

class DummyWithUuidExtension < ActiveRecord::Base
  include UuidExtension
end

# teardown_db # And drop them right afterwards
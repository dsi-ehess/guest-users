require 'rails/generators'
require 'rails/generators/active_record'

module GuestUsers
  class InstallGenerator < ActiveRecord::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def copy_migrations
      copy_migration "add_fields_to_users"
    end

    def add_feature
      copy_file 'config/features.rb'
    end

    protected

    def copy_migration(filename)
      if self.class.migration_exists?("db/migrate", "#{filename}")
        say_status("skipped", "Migration #{filename}.rb already exists")
      else
        migration_template "migrations/#{filename}.rb", "db/migrate/#{filename}.rb"
      end
    end
  end
end
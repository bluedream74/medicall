# frozen_string_literal: true

module RidgepoleTask
  extend Rake::DSL

  namespace :ridgepole do
    desc "Exec Apply Dry Run"
    task apply_dry_run: :environment do
      ridgepole("-f #{schemafile} --apply --dry-run")
    end

    desc "Exec Apply"
    task apply: :environment do
      ridgepole("-f #{schemafile} --apply --drop-table")
    end

    desc "Exec Export Schemafile"
    task export: :environment do
      ridgepole("--export -o #{schemafile}")
    end
  end

  class << self
    def ridgepole(option)
      p "#{environments}bundle exec ridgepole -c #{config_file} -E #{Rails.env} --dump-with-default-fk-name #{option}"
      system "#{environments}bundle exec ridgepole -c #{config_file} -E #{Rails.env} --dump-with-default-fk-name #{option}"
    end

    def schemafile
      Rails.root.join("Schemafile")
    end

    def environments
      return "" if ENV["DATABASE_URL"].blank?

      "DATABASE_URL='#{ENV.fetch("DATABASE_URL", nil)}' "
    end

    def config_file
      Rails.root.join("config", "database.yml")
    end
  end
end

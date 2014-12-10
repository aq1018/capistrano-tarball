namespace :load do
  task :defaults do
    load 'capistrano/tarball/defaults.rb'
  end
end

namespace :tarball do
  def strategy
    @strategy ||= Capistrano::Tarball.new(
      self,
      fetch(:tarball_strategy, Capistrano::Tarball::DefaultStrategy)
    )
  end

  desc 'This task does nothing and exists for compatibility reasons.'
  task :check do
    # well... there is nothing to check.
  end

  desc 'Build tarball release locally.'
  task :package do
    run_locally do
      with app_env: fetch(:stage), tarball_path: strategy.local_path do
        strategy.package
      end
    end
  end

  desc 'Upload tarball release.'
  task upload: :"tarball:package" do
    on release_roles :all do
      strategy.upload
      strategy.test
    end
  end

  desc 'Copy tarball to releases'
  task create_release: :"tarball:upload" do
    on release_roles :all do
      execute :mkdir, '-p', release_path
      strategy.release
    end
  end

  desc 'Determine the revision that will be deployed'
  task :set_current_revision do
    on release_roles :all do
      set :current_revision, strategy.fetch_revision
    end
  end
end

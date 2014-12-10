p "*************Loaded #{__FILE__}"

require 'tmpdir'

namespace :load do
  task :defaults do
    # :tarball_release_tag
    #
    # This will become the contents of the <release_path>/REVISION file.
    # Defaults to current git HEAD short hash
    set :tarball_release_tag, -> {
      `git log --pretty=format:'%h' -n 1 HEAD`
    }

    # :tarball_name
    #
    # The generated tarball file name.
    # Defaults to <:application>-<:stage>-<tarball_release_tag>.tar.gz
    set :tarball_name, -> {
      "#{fetch(:application)}-#{fetch(:stage)}-#{fetch(:tarball_release_tag)}.tar.gz"
    }

    # :tarball_remote_path
    #
    # The location to store the tarball on a remote host.
    set :tarball_remote_path, -> {
      File.join(fetch(:tmp_dir), fetch(:tarball_name))
    }

    # :tarball_local_path
    #
    # The local path for the packaged tarball.
    set :tarball_local_path, -> {
      File.join(Dir.tmpdir, fetch(:tarball_name))
    }


    # :tarball_package_cmd
    #
    # The command to run in order to package the tarball.
    # Default behavior is to compress the current working directory, and save the
    # output to /tmp/<:tarball_name>. It's possible to customize this command to
    # be something like "make tarball" if you are using a build system. When making
    # a custom script, APP_ENV and TARBALL_PATH environmental variables can be used
    # with in the custom script to determine where the tarball should be saved, and
    # which application environment / stage the tarball is intended to be deployed
    # to.
    set :tarball_package_cmd, -> {
      [:tar, '-czf', fetch(:tarball_local_path), '.']
    }

    # :tarball_release_cmd
    #
    # The command to run in order to extract the tarball into the <:release_path>.
    set :tarball_release_cmd, -> {
      [:tar, '-xf', fetch(:tarball_remote_path), '-C', fetch(:release_path)]
    }
  end
end

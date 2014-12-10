load File.expand_path("../tasks/tarball.rake", __FILE__)

require 'capistrano/scm'

class Capistrano::Tarball < Capistrano::SCM
  def name
    fetch(:tarball_name)
  end

  def package_cmd
    fetch(:tarball_package_cmd)
  end

  def release_cmd
    fetch(:tarball_release_cmd)
  end

  def remote_path
    File.join(fetch(:tmp_path), name)
  end

  def local_path
    File.join(Dir.tmpdir, name)
  end

  module DefaultStrategy
    def test
      test! " [ -f #{remote_path} ] "
    end

    def package
      context.execute package_cmd
    end

    def upload
      context.upload! local_path, remote_path
    end

    def release
      context.execute release_cmd
      context.execute :rm, remote_path
    end

    def fetch_revision
      fetch(:tarball_release_tag)
    end
  end
end

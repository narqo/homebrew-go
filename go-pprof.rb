require 'formula'

class GoGetDownloadStrategy < AbstractDownloadStrategy
  def fetch
    url = @url

    ohai "Fetching #{url}"

    HOMEBREW_CACHE.cd do
      ENV['GOPATH'] = "#{HOMEBREW_CACHE}/gopath"
      system "go", "get", "-u", url
    end
  end
end

class GoPprof < Formula
  url "github.com/google/pprof", :using => GoGetDownloadStrategy
  version "devel"

  depends_on "go" => :build

  def install
    #install_with_gopath
  end

  def install_with_gopath
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    ENV.prepend_create_path "PATH", buildpath/"bin"

    cd buildpath/"src/#github.com/google/pprof" do
      system "go", "install"
      prefix.install_metafiles
    end
  end

  def test
    false
  end
end
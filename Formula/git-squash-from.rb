class GitSquashFrom < Formula
    desc "Interactive CLI to squash commits into a selected base commit"
    homepage "https://github.com/hanif-mianjee/homebrew-git-squash-from"
    url "https://github.com/hanif-mianjee/git-squash-from/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "2ea78a4f50f0ed8a86d856bfd0e71f9a818f8aec334b6f7b440d45bd1334315b"  # Run `shasum -a 256 <tarball>` after release
    license "MIT"
  
    def install
      bin.install "bin/git-squash-from"
    end
  end
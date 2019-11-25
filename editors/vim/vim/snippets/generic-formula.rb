class FormulaName < Formula
  desc ''
  homepage ''
  url 'https://github.com/user/app/archive/version-of-app.tar.gz'
  sha256 '6500000000000000000000000000000000000000000000000000000000000000'
  head 'https://github.com/user/app/app-repo.git'

  depends_on '' => :build

  conflicts_with 'formula-name'

  def install
    ENV.append "", "-configure-flag"
    ENV.append "CFLAGS", ""
    ENV.append "CFLAGS", "--std=gnu89" if ENV.compiler == :clang
    
    # GNU autotools
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-debug"
    system "make"
    system sudo make install

    def caveats; <<~EOS
      This formula requires blahblah, but can't have blahblah installed.
    
    EOS
    end

    test do
      # prove that the formual successfully installed, and works as intended
      system 'false'
    end
  end
end

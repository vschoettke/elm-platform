class Elm < Formula
  homepage "http://elm-lang.org"
  sha256 "b1c349db1a576fff9b997c0134ebf698d03544329ec9783d382a0a70fbc19e0e"
  url "https://raw.githubusercontent.com/elm-lang/elm-platform/0.15/installers/BuildFromSource.hs",
    :nounzip => true

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    system "runhaskell", "BuildFromSource.hs", version

    bin.install Dir["Elm-Platform/#{version}/bin/*"]
  end

  def caveats
    <<-EOS.undent
      Grab a coffee! This can take a long time to install.

      Note that installing elm via Homebrew will also install the latest version
      of GHC via Homebrew. If you do not want the latest version of GHC installed,
      please see http://elm-lang.org for alternative ways to install Elm.
    EOS
  end

  test do
    system "elm", "make", "--help"
  end
end

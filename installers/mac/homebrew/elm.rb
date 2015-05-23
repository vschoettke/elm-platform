class Elm < Formula
  homepage "http://elm-lang.org"
  sha256 "b1c349db1a576fff9b997c0134ebf698d03544329ec9783d382a0a70fbc19e0e"
  url "https://raw.githubusercontent.com/elm-lang/elm-platform/0.15/installers/BuildFromSource.hs",
    :nounzip => true

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    ENV.deparallelize


    system "runhaskell", "BuildFromSource.hs", version

    bin.install Dir[buildpath/"Elm-Platform/#{version}/bin/*"]
  end

  test do
    system "elm", "make", "--help"
  end
end

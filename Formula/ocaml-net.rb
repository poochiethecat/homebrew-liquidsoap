require 'formula'

class OcamlNet < Formula
  homepage 'http://projects.camlcity.org/projects/ocamlnet.html'
  url 'http://download.camlcity.org/download/ocamlnet-3.5.1.tar.gz'
  md5 '9f4f474bfe88496220079e06791ff31c'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-pcre' => :build
  depends_on 'openssl' => :build

  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "-enable-pcre", "-enable-ssl", "-enable-zip", "-enable-crypto", "-bindir", "#{prefix}/bin", "-datadir", "#{lib}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end

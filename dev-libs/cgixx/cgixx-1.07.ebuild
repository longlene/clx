DESCRIPTION="A C++ library for writing CGI programs"
HOMEPAGE="http://content.noscience.net/projects/cgixx/"
SRC_URI="http://files.noscience.net/pub/cgixx/files/cgixx-1.07.tar.bz2"

SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND="virtual/libc virtual/libstdc++"

src_compile() {
	./configure.pl --prefix=${D}/usr ${EXTRA_ECONF} || die "configure.pl failed"
	emake || die "emake failed"
}

src_install() {
	use doc && dohtml -r doc/html/*
	rm -rf doc
	make  install || die "make install failed"
	dodoc INSTALL LICENSE README 
}

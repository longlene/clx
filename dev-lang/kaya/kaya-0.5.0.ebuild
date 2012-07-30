inherit autotools flag-o-matic

DESCRIPTION="A Staticly typed, imperative programming language"
HOMEPAGE="http://kayalang.org"
SRC_URI="http://kayalang.org/src/${P}.tgz"

IUSED="gd gnutls pcre postgres sdl sqlite msql"

SLOT="0"
LICENSE="GPLv2 and LGPLv2"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/ghc
	dev-haskell/happy
	sys-libs/zlib
	dev-libs/libpcre
	dev-libs/libgcrypt
	dev-libs/boehm-gc
	gnutls? ( net-libs/gnutls )
	pcre? ( dev-libs/libpcre )
	postgres? ( dev-db/postgresql )
	sqlite? ( dev-db/sqlite ) 
        sdl? ( media-libs/libsdl ) 
	gd? ( media-libs/gd )
	media-libs/freeglut
	media-libs/mesa
	sys-libs/ncurses
	msql? ( dev-db/mysql ) "


DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	
	epatch "${FILESDIR}/${P}-conf.patch" || die "epatch conf failed"

	epatch "${FILESDIR}/${P}-smp.patch" || die "epatch smp failed"
      
        filter-flags -D_FORTIFY_SOURCE=2
	fstack-flags	

	eautoconf
}

src_compile() {

      econf || die "econf failed" 

      emake || die "emake failed"
}

src_install() {
     make install DESTDIR=${D} ibdir=/usr/$(get_libdir)/kaya
     dodoc COPYING GPL* LGPL* 
     docinto examples/cookies
     dodoc examples/cookies/*
     docinto examples/display
     dodoc examples/display/*
     docinto examples/lam
     dodoc examples/lam/*
     docinto examples/misc
     dodoc examples/misc/*
     docinto examples/parser
     dodoc examples/parser/*
     docinto examples/shape
     dodoc examples/shape/*
     docinto examples/sudoku
     dodoc examples/sudoku/*
     docinto examples/upload
     dodoc examples/upload/*
     docinto examples/webapps
     dodoc examples/webapps/*
     docinto docs
     dodoc docs/*
}

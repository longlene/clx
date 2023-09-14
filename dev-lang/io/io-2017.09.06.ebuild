# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Io is a small, prototype-based programming language"
HOMEPAGE="http://www.iolanguage.com"
SRC_URI="https://github.com/IoLanguage/io/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cgi clutter dbi doc editline google gui http image jabber libffi libxml2
	lzo md5 ncurses ogg opengl postgres pcre python readline sha1 sndfile sockets
	sqlite syslog theora threads truetype twitter vorbis zlib"
DEPEND="clutter? ( media-libs/clutter )
		dbi? ( dev-db/libdbi )
		editline? ( dev-libs/libedit )
		image? ( virtual/jpeg
			media-libs/tiff
			media-libs/libpng )
		jabber? ( net-libs/loudmouth )
		libffi? ( virtual/libffi )
		libxml2? ( dev-libs/libxml2 )
		lzo? ( dev-libs/lzo )
		ncurses? ( sys-libs/ncurses )
		ogg? ( media-libs/libogg )
		opengl? ( virtual/opengl )
		pcre? ( dev-libs/libpcre )
		postgres? ( dev-db/postgresql-server )
		readline? ( sys-libs/readline )
		sndfile? ( media-libs/libsndfile )
		sqlite? ( >=dev-db/sqlite-3.0.0 )
		theora? ( media-libs/libtheora )
		truetype? ( media-libs/freetype )
		vorbis? ( media-libs/libvorbis )
		zlib? ( sys-libs/zlib )"
RDEPEND=""
REQUIRED_USE="vorbis? ( ogg )"

src_prepare() {
	eapply_user
	epatch "${FILESDIR}"/${P}-gentoo-fixes.patch
	sed  -i "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
			addons/*/CMakeLists.txt \
			libs/*/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_CGI=$(usex cgi)
		-DENABLE_CLUTTER=$(usex clutter)
		-DENABLE_DBI=$(usex dbi)
		-DENABLE_EDITLINE=$(usex editline)
		-DENABLE_CFFI=$(usex libffi)
		-DENABLE_FLUX=$(usex gui)
		-DENABLE_GOOGLESEARCH=$(usex google)
		-DENABLE_HTTPCLIENT=$(usex http)
		-DENABLE_LOUDMOUTH=$(usex jabber)
		-DENABLE_IMAGE=$(usex image)
		-DENABLE_LIBXML2=$(usex libxml2)
		-DENABLE_LZO=$(usex lzo)
		-DENABLE_MD5=$(usex md5)
		-DENABLE_CURSES=$(usex ncurses)
		-DENABLE_OGG=$(usex ogg)
		-DENABLE_OPENGL=$(usex opengl)
		-DENABLE_POSTGRES=$(usex postgres)
		-DENABLE_PYTHON=$(usex python)
		-DENABLE_READLINE=$(usex readline)
		-DENABLE_REGEX=$(usex pcre)
		-DENABLE_LIBSNDFILE=$(usex sndfile)
		-DENABLE_SHA1=$(usex sha1)
		-DENABLE_SOCKET=$(usex sockets)
		-DENABLE_SQLITE=$(usex sqlite)
		-DENABLE_SYSLOG=$(usex syslog)
		-DENABLE_THEORA=$(usex theora)
		-DENABLE_THREADS=$(usex threads)
		-DENABLE_FONT=$(usex truetype)
		-DENABLE_TWITTER=$(usex twitter)
		-DENABLE_VORBIS=$(usex vorbis)
		-DENABLE_ZLIB=$(usex zlib)
		-DCMAKE_SKIP_RPATH=ON
	)
	cmake_src_configure
}

src_compile() {
	# Fix bug #414421
	cmake_src_compile -j1
}

src_install() {
	cmake_src_install
	if use doc; then
		dodoc docs/docs.css docs/*.html
	fi
}

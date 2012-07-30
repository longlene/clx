inherit ruby gems

DESCRIPTION="Rubygame is a cross-platform multimedia library for ruby"
HOMEPAGE="http://rubygame.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="LGPL"
KEYWORDS="~x86"

IUSE="doc nogfx noimage nottf nomixer"
RDEPEND=">=dev-lang/ruby-1.8
		 >=media-libs/libsdl-1.2.7
		 !nogfx? ( >=media-libs/sdl-gfx-2.0.10 )
		 !noimage? ( >=media-libs/sdl-image-1.2.3 )
		 !nottf? ( >=media-libs/sdl-ttf-2.0.6 )
		 !nomixer? ( >=media-libs/sdl-mixer-1.2.7 )"
DEPEND="${RDEPEND}
		>=dev-ruby/rake-0.7.0"

GEM_SRC="${WORKDIR}/${P}/pkg/${P}.gem"

pkg_setup() {
	# See: #1817457 on http://tinyurl.com/39qek9
	#RUBYGAME_CONFIG="--cflags '$(CFLAGS)' -lflags '$(LDFLAGS)'"
	RUBYGAME_CONFIG=""
	use nogfx && RUBYGAME_CONFIG += "--no-gfx"
	use noimage && RUBYGAME_CONFIG += "--no-image"
	use nomixer && RUBYGAME_CONFIG += "--no-mixer"
	use nottf && RUBYGAME_CONFIG += "--no-ttf"
	export RUBYGAME_CONFIG
}

src_unpack() {
	unpack "${A}"
}

src_compile() {
	cd "${WORKDIR}/${P}"
	rake gem || die
	use doc && (rake rdoc || die)
}


inherit qt4-r2
inherit git-2

EAPI="2"
DESCRIPTION="Simple Qt audio player."
HOMEPAGE="https://sourceforge.net/projects/kajammer/"
EGIT_REPO_URI="git://github.com/pvtcupcakes/kajammer.git"
LICENSE="GPL-3"

KEYWORDS="~amd64 ~x86"
IUSE="kde"
SLOT="0"

DEPEND="x11-libs/qt-core:4
	x11-libs/qt-gui:4
	kde? ( media-sound/phonon )
	!kde? ( x11-libs/qt-phonon )"

src_unpack() {
	git_src_unpack
}

src_prepare() {
	echo ""
}

src_configure() {
	econf	
	eqmake4
}

src_compile() {	
	emake	
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "emake install failed"	
}


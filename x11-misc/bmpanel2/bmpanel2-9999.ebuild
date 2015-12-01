# Gentoo Ebuild for bmpanel2

EAPI=5

inherit cmake-utils git-2

EGIT_REPO_URI="git://github.com/nsf/bmpanel2.git"


DESCRIPTION="Great panel for your desktop, support clock , task manage , workspace and more"
HOMEPAGE="http://code.google.com/p/bmpanel2/"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11
		x11-libs/cairo"
RDEPEND="${DEPEND}"

src_unpack() {
		git_src_unpack
}

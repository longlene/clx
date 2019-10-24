# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="A runtime for javascript applictions built on google v8 JS"
HOMEPAGE="http://fibjs.org"
SRC_URI="https://github.com/fibjs/fibjs/releases/download/v${PV}/fullsrc.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/fibjs

src_prepare() {
	eapply_user
	sed -e "/VENDER_PATH=/{s#\`pwd\`#${WORKDIR}/vender#}" -i "${WORKDIR}"/vender/build
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_TYPE=release
	)
	cmake-utils_src_configure
}

src_compile() {
	sh "${WORKDIR}"/vender/build release || die "compile failed"
	cmake-utils_src_compile
}

src_install() {
	dobin "${WORKDIR}"/bin/Linux_*_release/fibjs
	dodoc "${WORKDIR}"/README.md
}

# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="A runtime for javascript applictions built on google v8 JS"
HOMEPAGE="http://fibjs.org"
SRC_URI="https://github.com/fibjs/fibjs/releases/download/v${PV}/fullsrc.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="dev-util/cmake"
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_prepare() {
	default
	sed -e '/COMPILER=clang/d' -i vender/build_tools/cmake-scripts/get_env.cmake
}

src_compile() {
	sh build || die "compile failed"
}

src_install() {
	dobin bin/Linux_*_release/fibjs
	dodoc README.md
}


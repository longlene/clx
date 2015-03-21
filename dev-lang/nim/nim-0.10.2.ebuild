# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

DESCRIPTION="A statically typed, imperative programming language"
HOMEPAGE="http://nim-lang.org"
SRC_URI="https://github.com/Araq/Nim/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="readline"

DEPEND=""
RDEPEND="${DEPEND}
readline? ( sys-libs/readline )"
S="${WORKDIR}"/Nim-${PV}

src_compile() {
	sh build.sh || die "compile failed"
	./bin/nim c koch || die "compile koch failed"
	./koch boot -d:release ${BUILD_OPTION} || die "bootstrap failed"
}


src_install() {
	./koch install ${D}/usr/$(get_libdir)
	dosym /usr/$(get_libdir)/${PN}/bin/nim /usr/bin/nim
}



# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

MY_CSOURCES_PV=0.9.4

DESCRIPTION="A statically typed, imperative programming language"
HOMEPAGE="http://nim-lang.org"
SRC_URI="https://github.com/nim-lang/csources/archive/v${MY_CSOURCES_PV}.tar.gz -> csources-${MY_CSOURCES_PV}.tar.gz
https://github.com/Araq/Nim/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="readline"

DEPEND=""
RDEPEND="${DEPEND}
readline? ( sys-libs/readline )"
S="${WORKDIR}"/Nim-${PV}
CSOURCES_DIR="${WORKDIR}"/csources-${MY_CSOURCES_PV}
NIMROD_DIR="${WORKDIR}"/Nim-${PV}

src_compile() {
	local BUILD_OPTION=""
	use readline && BUILD_OPTION="-d:useGnuReadline"

	cd ${CSOURCES_DIR} && sh build.sh || die "compile failed"
	cp ${CSOURCES_DIR}/bin/nim ${NIMROD_DIR}/bin/nim
	cd ${NIMROD_DIR}
	./bin/nim c koch || die "compile koch failed"
	./koch boot -d:release ${BUILD_OPTION} || die "bootstrap failed"
}


src_install() {
	cd ${NIMROD_DIR}
	./koch install ${D}/usr/$(get_libdir)
	dosym /usr/$(get_libdir)/${PN}/bin/nim /usr/bin/nim
}



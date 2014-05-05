# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

DESCRIPTION="A statically typed, imperative programming language"
HOMEPAGE="http://nimrod-lang.org"
SRC_URI="https://github.com/nimrod-code/csources/archive/v${PV}.tar.gz -> csources-${PV}.tar.gz
https://github.com/Araq/Nimrod/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="readline"

DEPEND=""
RDEPEND="${DEPEND}
readline? ( sys-libs/readline )"
S="${WORKDIR}"/Nimrod-${PV}
CSOURCES_DIR="${WORKDIR}"/csources-${PV}
NIMROD_DIR="${WORKDIR}"/Nimrod-${PV}

src_compile() {
	local BUILD_OPTION=""
	use readline && BUILD_OPTION="-d:useGnuReadline"

	cd ${CSOURCES_DIR} && sh build.sh || die "compile failed"
	cp ${CSOURCES_DIR}/bin/nimrod ${NIMROD_DIR}/bin/nimrod
	cd ${NIMROD_DIR}
	./bin/nimrod c koch || die "compile koch failed"
	./koch boot -d:release ${BUILD_OPTION} || die "bootstrap failed"
}


src_install() {
	cd ${NIMROD_DIR}
	./koch install ${D}/usr/$(get_libdir)
	dosym /usr/$(get_libdir)/${PN}/bin/nimrod /usr/bin/nimrod
}



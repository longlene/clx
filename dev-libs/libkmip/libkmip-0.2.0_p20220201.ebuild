# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="66119416e2c89ab182343900418cecafe02b6e8d"

DESCRIPTION="A C implementation of the KMIP specification"
HOMEPAGE="https://github.com/OpenKMIP/libkmip"
SRC_URI="https://github.com/OpenKMIP/libkmip/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="|| ( Apache-2.0 BSD-3 )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

src_install() {
	emake DEST_DIR="${D}" PREFIX="/usr" LIB_DIR="$(get_libdir)" install
	einstalldocs
}

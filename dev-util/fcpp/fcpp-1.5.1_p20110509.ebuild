# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="ab314936e035c19dc8d2287aa188228a2ab7db37"

DESCRIPTION="Frexx C preprocessor"
HOMEPAGE="https://daniel.haxx.se/projects/fcpp/"
SRC_URI="https://github.com/bagder/fcpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin fcpp
	dodoc README
}

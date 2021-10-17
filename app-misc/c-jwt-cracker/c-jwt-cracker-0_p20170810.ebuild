# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="906d670ad63f7fbf15bbf8b8741aa3fb7f475cf3"

DESCRIPTION="JWT brute force cracker written in C"
HOMEPAGE="https://github.com/brendan-rius/c-jwt-cracker"
SRC_URI="https://github.com/brendan-rius/c-jwt-cracker/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin jwtcrack
	dodoc README.md
}

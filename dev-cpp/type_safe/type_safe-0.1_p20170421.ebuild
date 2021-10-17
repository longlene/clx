# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="4a80f404a07fda6a190e9ce90548b175df8e1379"

DESCRIPTION="Zero overhead utilities for preventing bugs at compile time"
HOMEPAGE="https://github.com/foonathan/type_safe"
SRC_URI="https://github.com/foonathan/type_safe/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r include
	dodoc README.md
}

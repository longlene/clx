# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="ca196b342374fa4559fa5bd0f002b91b1ee5537f"

DESCRIPTION="Never - Functional Programming Language"
HOMEPAGE="https://github.com/smaludzi/never"
SRC_URI="https://github.com/smaludzi/never/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin nev
	dodoc README.md
}

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="e0eb0af4bcf3eebc85fbef8934eebf0849ff505e"

DESCRIPTION="PEDA - Python Exploit Development Assistance for GDB"
HOMEPAGE="https://github.com/longld/peda"
SRC_URI="https://github.com/longld/peda/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/${PN}
	doins -r lib peda.py
	dodoc README{,.md} python23-compatibility.md
}

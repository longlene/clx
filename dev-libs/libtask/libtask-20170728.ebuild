# Copyright 2008-2017 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="cfc03960888a465787d51a41a498c625882f4730"

DESCRIPTION="a Coroutine Library for C and Unix"
HOMEPAGE="http://swtch.com/libtask/"
SRC_URI="https://github.com/0intro/libtask/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins task.h
	dolib.a libtask.a

	dodoc README
}

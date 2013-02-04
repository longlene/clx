# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit vcs-snapshot

DESCRIPTION="A simple coroutine library."
HOMEPAGE="http://swtch.com/libtask/"
SRC_URI="https://libtask.googlecode.com/files/${P}.tgz"

LICENSE="libtask"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins task.h
	insinto /usr/lib64
	doins libtask.a

	dodoc README
}

# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A command-line TODO manager"
HOMEPAGE="http://todotxt.com/"
SRC_URI="http://todotxt.com/download/${PN}.sh.zip"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-shells/bash"

S=${WORKDIR}

src_install() {
	dodir /usr/share/todo
	insinto /usr/share/todo
	doins .todo
	newbin todo.sh todo
}

pkg_postinst() {
	einfo "You can find a .todo example in /usr/share/todo"
}

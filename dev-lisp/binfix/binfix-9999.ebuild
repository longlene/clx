# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A powerful infix syntax notation for Common LISP"
HOMEPAGE="https://github.com/vcerovski/binfix/"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/vcerovski/binfix.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-install-sources -t all *.asd *.lisp doc
	dodoc README.md
}

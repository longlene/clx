# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3

DESCRIPTION="A powerful infix syntax notation for Common LISP"
HOMEPAGE="https://github.com/vcerovski/binfix/"
SRC_URI="https://github.com/vcerovski/binfix/archive/v${PV}.tar.gz -> ${P}.tar.gz"

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

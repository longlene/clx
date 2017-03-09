# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

DESCRIPTION="A library for accessing multibyte integers from octet arrays and streams"
HOMEPAGE="http://method-combination.net/lisp/nibbles/"
SRC_URI="https://github.com/froydnj/nibbles/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README LICENSE NEWS
}

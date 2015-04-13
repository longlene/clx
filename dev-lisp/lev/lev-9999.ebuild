# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="libev bindings for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/lev"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/lev.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/libev
dev-lisp/cffi"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}

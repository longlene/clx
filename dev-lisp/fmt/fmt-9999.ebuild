# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Extensible text formatting facility for Common Lisp"
HOMEPAGE="https://github.com/mmontone/fmt/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mmontone/fmt.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf ${PN}.asd ${PN}-time.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf ${PN}-test.asd
	fi
	dodoc README.md
}

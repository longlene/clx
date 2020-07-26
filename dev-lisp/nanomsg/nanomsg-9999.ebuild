# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="A Common Lisp wrapper for the nanomsg library"
HOMEPAGE="https://github.com/photex/cl-nanomsg"
SRC_URI=""
EGIT_REPO_URI="https://github.com/photex/cl-nanomsg.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-autowrap
"

src_install() {
	common-lisp-install-sources -t all src
	common-lisp-install-asdf ${PN}.asd
	dodoc README.md


}

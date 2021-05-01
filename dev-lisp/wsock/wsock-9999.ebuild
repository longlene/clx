# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Low-level UNIX socket library"
HOMEPAGE="https://github.com/fukamachi/wsock"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/wsock.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
"

src_install() {
	common-lisp-install-sources -t all src README.markdown
	common-lisp-install-asdf wsock.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf wsock-test.asd
	fi
}

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Low-level UNIX socket library"
HOMEPAGE="https://github.com/fukamachi/wsock"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/wsock.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
"

src_install() {
	common-lisp-3_src_install
	common-lisp-src-install -t all README.markdown
}

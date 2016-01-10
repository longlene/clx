# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 common-lis-3

DESCRIPTION="Common Lisp EPMD client and server"
HOMEPAGE="https://github.com/flambard/cl-epmd"
SRC_URI=""

EGIT_REPO_URI="https://github.com/flambard/cl-epmd.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/binary-data
	dev-lisp/usocket
"

src_prepare() {
	use test || rm -rf test epmd-test.asd
}

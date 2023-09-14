# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0be84a99584e6b46f3c3120a0f1a655770e1cd6c"

DESCRIPTION="A library of portable lock-free data structures in Common Lisp"
HOMEPAGE="https://github.com/binghe/cl-lockfree"
SRC_URI="https://github.com/binghe/cl-lockfree/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/portable-threads
"

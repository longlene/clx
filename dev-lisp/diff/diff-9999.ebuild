# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit common-lisp-3 git-r3

DESCRIPTION="DIFF is a Common Lisp library for computing the unified or context"
HOMEPAGE="http://www.cliki.net/DIFF"

EGIT_REPO_URI="https://github.com/froydnj/diff.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~sparc ~x86"

RDEPEND="!dev-lisp/cl-${PN}"

src_prepare() {
	epatch "${FILESDIR}"/9999-gentoo-fix.patch
}

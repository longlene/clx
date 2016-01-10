# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 common-lisp-3

DESCRIPTION="Pure Common Lisp library for antialiased cursor rendering"
HOMEPAGE="https://github.com/filonenko-mikhail/clx-cursor"
SRC_URI=""

EGIT_REPO_URI="https://github.com/filonenko-mikhail/clx-cursor.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clx
	dev-lisp/cl-fad
"

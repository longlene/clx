# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp wrapper library for the Discount markup parser"
HOMEPAGE="https://github.com/lokedhs/discount"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lokedhs/discount.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	app-text/discount
"

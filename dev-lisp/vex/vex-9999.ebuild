# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Yet another vector math library for Common Lisp"
HOMEPAGE="https://github.com/sjl/vex"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sjl/vex.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lam
"

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="DEFPACKAGE-PLUS is an extensible DEFPACKAGE variant with version support"
HOMEPAGE="https://github.com/rpav/defpackage-plus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rpav/defpackage-plus.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
"

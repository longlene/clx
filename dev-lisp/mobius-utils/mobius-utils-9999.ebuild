# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp Utilities from mobius"
HOMEPAGE="https://github.com/mobius-eng/mobius-utils"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mobius-eng/mobius-utils.git"

LICENSE="LLGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/optima
"

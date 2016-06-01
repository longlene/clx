# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp library to help group data into trees"
HOMEPAGE="https://github.com/AccelerationNet/group-by"
SRC_URI=""

EGIT_REPO_URI="https://github.com/AccelerationNet/group-by.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
"

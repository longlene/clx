# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="common lisp library providing common math functions used in games"
HOMEPAGE="https://github.com/cbaggers/rtg-math"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cbaggers/rtg-math.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

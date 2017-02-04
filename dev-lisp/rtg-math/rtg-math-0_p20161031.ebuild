# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6548b3f98935046261f9e955642cf9207c287057"

DESCRIPTION="common lisp library providing common math functions used in games"
HOMEPAGE="https://github.com/cbaggers/rtg-math"
SRC_URI="https://github.com/cbaggers/rtg-math/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

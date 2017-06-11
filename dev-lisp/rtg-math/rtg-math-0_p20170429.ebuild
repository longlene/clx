# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="291bde34a587c15af20829d35f76a083655c03ee"

DESCRIPTION="common lisp library providing common math functions used in games"
HOMEPAGE="https://github.com/cbaggers/rtg-math"
SRC_URI="https://github.com/cbaggers/rtg-math/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"

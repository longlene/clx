# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b63b471c9e5a1d6d1d10e991ee81d68f817e1e0c"

DESCRIPTION="Vantage point trees for Common Lisp"
HOMEPAGE="https://github.com/shamazmazum/vp-trees"
SRC_URI="https://github.com/shamazmazum/vp-trees/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

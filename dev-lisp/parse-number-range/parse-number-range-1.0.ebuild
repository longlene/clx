# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Parses LOOP's convenient \"for-as-arithmetic\" syntax"
HOMEPAGE="https://github.com/Hexstream/parse-number-range"
SRC_URI="https://github.com/Hexstream/parse-number-range/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/map-bind
	dev-lisp/cartesian-product-switch
	dev-lisp/enhanced-multiple-value-bind
	test? ( dev-lisp/parachute )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r tests
}

# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Provides a simple unified extensible way of processing named definitions"
HOMEPAGE="https://github.com/Hexstream/definitions-systems"
SRC_URI="https://github.com/Hexstream/definitions-systems/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/incognito-keywords
	test? ( dev-lisp/parachute )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r tests
}

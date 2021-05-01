# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="91d17d3e9208db9438b72bb60037644fd79fb497"

DESCRIPTION="A small hash utility library for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-hash-util"
SRC_URI="https://github.com/orthecreedence/cl-hash-util/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	use test || rm ${PN}-test.asd tests.lisp
}


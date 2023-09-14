# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="13e30916dfce130a6b35c22cd7969a9cba20a8f0"

DESCRIPTION="check params"
HOMEPAGE="https://github.com/fukamachi/safety-params"
SRC_URI="https://github.com/fukamachi/safety-params/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parse-number
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "safety-params\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}

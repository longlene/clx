# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="00384c390786ac68e1c91cdbfb15c36e07077f81"

DESCRIPTION="Bisection algorithms in Common Lisp"
HOMEPAGE="https://github.com/sbwhitecap/bisect"
SRC_URI="https://github.com/sbwhitecap/bisect/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/rove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "bisect\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="45244faa4d460791031e872e1014e99cbd57dad8"

DESCRIPTION="Clon is a Common Lisp library for scheduling much like cron"
HOMEPAGE="https://github.com/igorpikman/clon"
SRC_URI="https://github.com/igorpikman/clon/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-timers
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	rm -rf ${PN}-test.{asd,lisp}
}

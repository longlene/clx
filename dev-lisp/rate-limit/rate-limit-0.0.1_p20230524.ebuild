# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c28c9bfe2fb1489251d247537240d9c8b6c93d87"

DESCRIPTION="Common Lisp utility to implement rate-limit functionality"
HOMEPAGE="https://github.com/rlevins/rate-limit"
SRC_URI="https://github.com/rlevins/rate-limit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "rate-limit\/test"/,$d' \
		-i rate-limit.asd
	rm -rf test rate-limit-examples.lisp
}

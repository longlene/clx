# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bafc33cd99adc12b922870df3c51f9cbc927baff"

DESCRIPTION="Common Lisp Scheduler"
HOMEPAGE="https://github.com/endsec/scheduler"
SRC_URI="https://github.com/endsec/scheduler/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/local-time
	dev-lisp/optima
"

src_prepare() {
	default
	sed -e '/defsystem "scheduler\/tests/,$d' \
		-i ${PN}.asd
	rm ${PN}-tests.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md LICENSE
}

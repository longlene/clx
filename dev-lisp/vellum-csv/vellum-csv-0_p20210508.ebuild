# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="462545e8b5c6c5998322b0fa23a3e365d5e152eb"

DESCRIPTION="CSV support for Vellum Data Frames"
HOMEPAGE="https://github.com/sirherrbatka/vellum-csv/"
SRC_URI="https://github.com/sirherrbatka/vellum-csv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/serapeum
	dev-lisp/vellum
	dev-lisp/alexandria
	dev-lisp/documentation-utils-extensions
	dev-lisp/fare-csv
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd
}

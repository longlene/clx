# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2f722f12f1d08e1b9550a46e2a22adba8e1e52c4"

DESCRIPTION="Common Lisp interface to the GNU Scientific Library."
HOMEPAGE="http://common-lisp.net/project/gsll/"
SRC_URI="https://github.com/malcolmreynolds/GSLL/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3 FDL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=sci-libs/gsl-1.9
	>=dev-lisp/cffi-0.10.5
	dev-lisp/fsbv
	dev-lisp/gsd
	dev-lisp/trivial-garbage
	dev-lisp/cl-utilities
	dev-lisp/asdf-system-connections
	dev-lisp/iterate
	dev-lisp/lisp-unit
"

src_prepare() {
	eapply_user
	use test || rm -r tests ${PN}-tests.asd
}



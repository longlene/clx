# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="User configuration and data file management"
HOMEPAGE="https://github.com/atlas-engineer/nfiles"
SRC_URI="https://github.com/atlas-engineer/nfiles/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/hu_dwim_defclass-star
	dev-lisp/quri
	dev-lisp/serapeum
	dev-lisp/trivial-garbage
	dev-lisp/trivial-package-local-nicknames
	dev-lisp/trivial-types
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "nfiles\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}

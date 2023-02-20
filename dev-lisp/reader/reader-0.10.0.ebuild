# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A utility library intended at providing configurable reader macros for common tasks"
HOMEPAGE="https://github.com/digikar99/reader"
SRC_URI="https://github.com/digikar99/reader/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/fiveam
	dev-lisp/iterate
	dev-lisp/split-sequence
	dev-lisp/trivial-types
"
BDEPEND=""

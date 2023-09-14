# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2410dd1386fb5dbc2b0cc876d4d9cb8468abec71"

DESCRIPTION="A utility library intended at providing configurable reader macros for common tasks"
HOMEPAGE="https://github.com/digikar99/reader"
SRC_URI="https://github.com/digikar99/reader/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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

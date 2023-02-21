# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A correct and safe JSON parser"
HOMEPAGE="https://github.com/Zulu-Inuoe/jzon"
SRC_URI="https://github.com/Zulu-Inuoe/jzon/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/flexi-streams
	dev-lisp/float-features
	dev-lisp/trivial-gray-streams
"
BDEPEND=""

src_prepare() {
	default
	rm -rf test JSONTestSuite
}

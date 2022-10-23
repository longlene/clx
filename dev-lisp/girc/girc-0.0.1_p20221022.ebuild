# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="38908cb8afaade89e8da06e69df94a08707c4781"

DESCRIPTION="Simple IRC client for the terminal"
HOMEPAGE="https://github.com/McParen/girc"
SRC_URI="https://github.com/McParen/girc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/usocket
	dev-lisp/croatoan
"
BDEPEND=""

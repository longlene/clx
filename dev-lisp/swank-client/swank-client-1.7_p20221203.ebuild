# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="dd0ff41c09687fb86561f16ad45c320cbeaf4ba8"

DESCRIPTION="Common Lisp implementation of a Slime / Swank client"
HOMEPAGE="https://github.com/brown/swank-client"
SRC_URI="https://github.com/brown/swank-client/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/base
	dev-lisp/usocket
	app-emacs/slime
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem swank-client\/test/,$d' \
		-i ${PN}.asd
	rm ${PN}-test.lisp
}

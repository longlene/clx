# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ac630f696090b84af0da42996727dd4864683c21"

DESCRIPTION="A Common Lisp wrapper around nsf/termbox"
HOMEPAGE="https://github.com/cl-fui/cl-termbox"
SRC_URI="https://github.com/cl-fui/cl-termbox/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/termbox
	dev-lisp/cl-autowrap
	dev-lisp/trivial-garbage
"

src_prepare() {
	eapply_user
	rm test.lsp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src/autospec
}

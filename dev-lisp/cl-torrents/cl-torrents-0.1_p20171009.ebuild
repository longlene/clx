# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="53d4e7cb4d4cd0d39b70c49aa88a5ba552e50ee2"

DESCRIPTION="Web scraping the Pirate Bay in Common Lisp"
HOMEPAGE="https://github.com/vindarel/cl-torrents"
SRC_URI="https://github.com/vindarel/cl-torrents/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="test"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-str
	dev-lisp/dexador
	dev-lisp/plump
	dev-lisp/mockingbird
	dev-lisp/cl-ansi-text
	dev-lisp/unix-opts
	dev-lisp/lquery
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}

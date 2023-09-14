# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Web scraping the Pirate Bay in Common Lisp"
HOMEPAGE="https://github.com/vindarel/cl-torrents"
SRC_URI="https://github.com/vindarel/cl-torrents/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="test"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/replic
	dev-lisp/cl-transmission
	dev-lisp/dexador
	dev-lisp/plump
	dev-lisp/cl-str
	dev-lisp/lparallel
	dev-lisp/cl-ansi-text
	dev-lisp/unix-opts
	dev-lisp/clache
	dev-lisp/mockingbird
	dev-lisp/lquery
	dev-lisp/py-configparser
	dev-lisp/cl-readline
	dev-lisp/parse-float
	dev-lisp/log4cl
	dev-lisp/nodgui
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org version.lisp-expr
}

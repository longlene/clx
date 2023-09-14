# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c7ff4c4fbdac22998e1e55cb953e81659e0d1414"

DESCRIPTION="Lisp web crawler and scrapper"
HOMEPAGE="https://github.com/vseloved/crawlik"
SRC_URI="https://github.com/vseloved/crawlik/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/rutils
	dev-lisp/drakma
	dev-lisp/cl-ppcre
	dev-lisp/cxml
	dev-lisp/eager-futrue2
	test? ( dev-lisp/should-test )
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}

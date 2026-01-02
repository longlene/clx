# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="f232d4dbbed03ff62ef8419eea580d2dfb9999de"

DESCRIPTION="Common Lisp client to interact with the Slynk server"
HOMEPAGE="https://github.com/Shookakko/slynk-client"
SRC_URI="https://github.com/Shookakko/slynk-client/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	app-emacs/sly
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
	dev-lisp/usocket
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	sed -e '/defsystem slynk-client\/test/,$d' \
		-i ${PN}.asd
	rm -rf tests
}

# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4bd950e8839710af50ffe38a750edc85e406c05e"

DESCRIPTION="A lisp native YAML parser"
HOMEPAGE="https://github.com/jasom/nyaml/"
SRC_URI="https://github.com/jasom/nyaml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/esrap
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/parse-number
	dev-lisp/trivia
	dev-lisp/fare-quasiquote
	dev-lisp/babel
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:nyaml\/test/,$d' ${PN}.asd
	rm -rf test
}

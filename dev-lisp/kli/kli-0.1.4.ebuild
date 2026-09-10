# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A radically extensible coding agent for the modern Lisp hacker"
HOMEPAGE="https://github.com/kleisli-io/kli"
SRC_URI="https://github.com/kleisli-io/kli/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	dev-lisp/sbcl
	dev-lisp/cl-base64
	dev-lisp/cl-difflib
	dev-lisp/cl-ppcre
	dev-lisp/cl-sqlite
	dev-lisp/colorize
	dev-lisp/drakma
	dev-lisp/ironclad
	dev-lisp/jzon
	dev-lisp/let-over-lambda
	dev-lisp/paren-repair
	dev-lisp/3bmd
"

RDEPEND="
	dev-db/sqlite:3
"

src_compile() {
	sbcl --script "${S}/build.lisp" || die "sbcl build failed"
}

src_install() {
	dobin bin/kli
}

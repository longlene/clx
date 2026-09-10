# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Standalone binary built with save-lisp-and-die; no common-lisp-3.
# All Lisp deps are baked into the image → BDEPEND only.
# Only C FFI libraries needed at runtime → RDEPEND.

DESCRIPTION="Short description of the application"
HOMEPAGE="https://github.com/owner/repo"
SRC_URI="https://github.com/owner/repo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	dev-lisp/sbcl
	dev-lisp/dep-one
	dev-lisp/dep-two
"

RDEPEND="
	dev-db/sqlite:3
"

src_compile() {
	sbcl --script build.lisp || die
}

src_install() {
	dobin bin/${PN}
}

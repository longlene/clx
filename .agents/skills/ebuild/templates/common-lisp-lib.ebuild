# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Short description of the library"
HOMEPAGE="https://github.com/owner/repo"
SRC_URI="https://github.com/owner/repo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-lisp/dep-one
	dev-lisp/dep-two
"

# Optional: strip test systems so they don't pollute the ASDF registry
src_prepare() {
	default
	rm -f "${PN}-tests.asd" tests.lisp
}

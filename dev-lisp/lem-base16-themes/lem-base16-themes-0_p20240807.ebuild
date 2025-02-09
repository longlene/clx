# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e09618e2f3a4ba9977167d3ea90123ecabd884ab"

DESCRIPTION="base16 themes for Lem editor/IDE"
HOMEPAGE="https://github.com/lukpank/lem-base16-themes"
SRC_URI="https://github.com/lukpank/lem-base16-themes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lem
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-generate.asd templates src/generate.lisp
}

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a28eaa13928d1845076137f7f979c3e445b13917"

DESCRIPTION="Utilities for interacting with the filesystem"
HOMEPAGE="https://github.com/Shinmera/filesystem-utils"
SRC_URI="https://github.com/Shinmera/filesystem-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/pathname-utils
	dev-lisp/documentation-utils
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test.lisp
}

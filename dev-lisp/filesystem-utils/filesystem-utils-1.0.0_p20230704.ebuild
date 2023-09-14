# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ef5e3fa5bdbbd1da974fd8497305ec0d967c7ccb"

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

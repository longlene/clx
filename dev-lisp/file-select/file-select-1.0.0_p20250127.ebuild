# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c10df36837396a1fbb58f4fd277d0a541433a013"

DESCRIPTION="A library to invoke the native system file dialog to select or create files"
HOMEPAGE="https://github.com/Shinmera/file-select"
SRC_URI="https://github.com/Shinmera/file-select/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/pathname-utils
	dev-lisp/documentation-utils
"
BDEPEND=""

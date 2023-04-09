# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="59e798a07e949e8957a20927f52aca425d84e4a0"

DESCRIPTION="A drop-in replacement for cl:documentation with support for multiple languages"
HOMEPAGE="https://github.com/Shinmera/multilang-documentation"
SRC_URI="https://github.com/Shinmera/multilang-documentation/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/language-codes
	dev-lisp/system-locale
"
BDEPEND=""

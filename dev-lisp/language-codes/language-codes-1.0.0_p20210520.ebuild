# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="07d353179ac057bfbc02345f101a7e64b9d22662"

DESCRIPTION="A simple library mapping ISO language codes to language names"
HOMEPAGE="https://github.com/Shinmera/language-codes"
SRC_URI="https://github.com/Shinmera/language-codes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""

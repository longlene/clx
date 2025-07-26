# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ec6e9177cc18407a6502cadf63887cbaf606469d"

DESCRIPTION="A library for defining and expanding templated functions"
HOMEPAGE="https://github.com/Shinmera/type-templates"
SRC_URI="https://github.com/Shinmera/type-templates/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/alexandria
	dev-lisp/form-fiddle
"
BDEPEND=""

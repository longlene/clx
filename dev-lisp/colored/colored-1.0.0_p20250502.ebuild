# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fe1f80350d761115aae99fc9bb990edb7a22414a"

DESCRIPTION="A library for dealing with colours and colour spaces"
HOMEPAGE="https://github.com/Shinmera/colored"
SRC_URI="https://github.com/Shinmera/colored/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test.lisp
}

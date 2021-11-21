# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bee87efb0b047da0f071f5cf1457997ab5f93feb"

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

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ed919ab37b0b9d2a7523a55d47c3f36d555223d4"

DESCRIPTION="A collection of utilities to help with pathname operations"
HOMEPAGE="https://github.com/Shinmera/pathname-utils"
SRC_URI="https://github.com/Shinmera/pathname-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd test.lisp
}

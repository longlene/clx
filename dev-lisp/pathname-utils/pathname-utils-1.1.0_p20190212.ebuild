# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="027be7dba1a7e0b42a28b42ee843b3a58355dcbc"

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
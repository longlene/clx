# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5e2013f595fd91c6300b6cfe96e3db1cf49ab530"

DESCRIPTION="A tiny collection of utilities to work with arrays and vectors"
HOMEPAGE="https://shinmera.github.io/array-utils"
SRC_URI="https://github.com/Shinmera/array-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd tests.lisp
}

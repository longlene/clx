# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5cab7505653a489a00244772bccedf0eab07ed30"

DESCRIPTION="Partially apply functions and expressions in the spirit of SRFI 26"
HOMEPAGE="https://github.com/cromachina/cl-cut/"
SRC_URI="https://github.com/cromachina/cl-cut/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	use test || rm -rf cl-cut.test.asd test
}

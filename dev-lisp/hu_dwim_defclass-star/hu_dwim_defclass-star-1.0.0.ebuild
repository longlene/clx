# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A Common Lisp DEFCLASS* for less boilerplate"
HOMEPAGE="https://github.com/hu-dwim/hu.dwim.defclass-star"
SRC_URI="https://github.com/hu-dwim/hu.dwim.defclass-star/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hu_dwim_asdf
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r hu.dwim.defclass-star.test.asd test
}

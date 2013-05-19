# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="2"

NEED_PYTHON=2.4

inherit distutils

DESCRIPTION="Python module to calculate the Levenshtein edit distance between two strings."
HOMEPAGE="http://www.mindrot.org/projects/py-editdist/"
SRC_URI="http://www.mindrot.org/files/py-editdist/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/python-2.4"
RDEPEND="${DEPEND}"

src_compile() {
	distutils_src_compile
}
src_install() {
	distutils_src_install
}

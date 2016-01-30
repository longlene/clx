# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit distutils

DESCRIPTION="PyWordNet is a Python interface to the WordNet database of word meanings"
HOMEPAGE="http://osteele.com/projects/pywordnet/"
SRC_URI="mirror://sourceforge/pywordnet/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ia64"
IUSE=""

DEPEND=">=dev-lang/python-2.1.3-r1"

src_install() {
	distutils_src_install
}


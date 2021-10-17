# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="A simple header-only C++ argument parser library"
HOMEPAGE="https://github.com/Taywee/args"
SRC_URI="https://github.com/Taywee/args/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

DEPEND="doc? ( app-doc/doxygen )"
RDEPEND="${DEPEND}"

src_compile() {
	use doc && emake doxygen Doxyfile
}

src_install() {
	insinto /usr/include
	doins args.hxx
	use doc && doman doc/man/man3/*.3
	dodoc README.md
}

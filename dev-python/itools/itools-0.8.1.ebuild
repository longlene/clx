# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="itools is a Python meta-package, it provides tools such as a
workflow engine or a really fast template language."
HOMEPAGE="http://www.ikaaro.org/itools/"
SRC_URI="http://www.ikaaro.org/download/itools/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""

DEPEND=">=dev-lang/python-2.3"

src_install() {
        distutils_src_install
        dohtml doc/*
        insinto /usr/share/doc/${PF}
        doins doc/*
        insinto /usr/share/doc/${PF}/examples
		doins doc/examples/*
        insinto /usr/share/doc/${PF}/examples/chapter5
		doins doc/examples/chapter5/*
        insinto /usr/share/doc/${PF}/examples/chapter7
		doins doc/examples/chapter7/*
        insinto /usr/share/doc/${PF}/examples/chapter8
		doins doc/examples/chapter8/*
}

# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

NEED_PYTHON=2.4

inherit distutils

MY_P="${P/_pre/p}"
DESCRIPTION="A stand-alone python to javascript compiler, an AJAX framework / library and a Widget set API."
HOMEPAGE="http://pyjs.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tgz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="doc"
DEPEND=""

S="${WORKDIR}/${MY_P}"

src_compile() {
	python bootstrap.py /usr/share/${PN}
	mv run_bootstrap_first_then_setup.py setup.py
}
src_install() {
	distutils_src_install
	dobin bin/pyjsbuild bin/pyjscompile
	if use doc ; then
		dohtml -r doc/*
	fi
}

# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/registry_py/registry_py-0.2.ebuild 2004/08/05 23:18:35 arj Exp $

DESCRIPTION="Python Binding for Elektra"
HOMEPAGE="http://acm.cs.uwec.edu/~lemkesr/"
SRC_URI="http://acm.cs.uwec.edu/~lemkesr/${P}.tar.gz"

LICENSE="N/A"
SLOT="0"
KEYWORDS="x86"
IUSE=""

#mhh lalala no Infos yet
DEPEND=">=app-admin/elektra-0.4
	>=dev-lang/python-2.3.3-r1"

src_compile() {
	sed -e "s/\"COPYING\", \"README\"//g" setup.py > setup.py.new
	mv setup.py.new setup.py
	python setup.py build || die "Faild to Compile"
}

src_install() {
	python setup.py install || die "Install Failed"
	dodoc README PKG-INFO
}

pkg_postinst() {
	einfo "Python Binding for Elektra is now Installed"
}

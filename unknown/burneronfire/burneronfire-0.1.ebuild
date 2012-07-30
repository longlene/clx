# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

MY_PN="BurnerOnFire"
MY_PF="${MY_PN}-${PV}"

DESCRIPTION="BurnerOnFire is multi-threaded program that can write content to multiple CD/DVD burners simultaneously"
HOMEPAGE="http://www.kiberpipa.org/burneronfire/"
SRC_URI="http://pypi.python.org/packages/source/B/${MY_PN}/${MY_PF}.tar.gz"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc gtk"

CDEPEND="dev-python/setuptools"
DEPEND="${CDEPEND}
	doc? ( >=dev-python/sphinx-0.6 )"
RDEPEND="${CDEPEND}
	dev-python/pygobject
	dev-python/minihallib
	app-cdr/cdrkit
	gtk? ( dev-python/pygtk )
	"
RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}/${MY_PF}"

src_compile(){
	if use doc; then
		cd "${S}/docs"
		PYTHONPATH=.. emake html || die "Building of documentation failed"
	fi
}

src_install(){
	distutils_src_install

	if use doc; then
		dohtml -r docs/build/html/* || die "Installation of documentation failed"
	fi

	if use gtk; then
		ebegin "Installing menu entry"
		newicon "${S}/${PN}/icons/burnthem.png" ${PN}.png
		make_desktop_entry ${PN} ${MY_PN} ${PN} "System;Utility;DiscBurning"
		eend $?
	fi
}

pkg_postinst() {
	elog "Be sure to read notes/warnings about usage at"
	elog "http://www.kiberpipa.org/burneronfire/#notes"
}

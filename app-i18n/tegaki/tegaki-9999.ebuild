# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

EGIT_REPO_URI="http://www.mblondel.org/code/hwr.git"
SRC_URI="
	http://www.tegaki.org/releases/0.3/models/tegaki-zinnia-japanese-0.3.zip
	http://www.tegaki.org/releases/0.3/models/tegaki-wagomu-japanese-0.3.zip"

inherit eutils distutils git

DESCRIPTION="Tegaki handwriting recognition"
HOMEPAGE="http://tegaki.org"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="+recognize +wagomu +gtk +ibus"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	git_src_unpack
	cd ${S}
	unpack ${A}
}

src_compile() {
	cd ${S}/tegaki-python && distutils_src_compile
	use recognize && cd ${S}/tegaki-recognize && distutils_src_compile
	use wagomu && cd ${S}/tegaki-engines/tegaki-wagomu && distutils_src_compile
	use gtk && cd ${S}/tegaki-pygtk && distutils_src_compile
	use ibus && cd ${S}/ibus-tegaki && distutils_src_compile
}

src_install() {
	cd ${S}/tegaki-python && distutils_src_install
	use recognize && cd ${S}/tegaki-recognize && distutils_src_install
	use wagomu && cd ${S}/tegaki-engines/tegaki-wagomu && distutils_src_install
	use gtk && cd ${S}/tegaki-pygtk && distutils_src_install
	use ibus && cd ${S}/ibus-tegaki && distutils_src_install

	mkdir -p ${D}/usr/share/tegaki/models/zinnia
	cp ${S}/tegaki-zinnia-japanese-0.3/handwriting-ja.{model,meta} ${D}/usr/share/tegaki/models/zinnia/

	mkdir -p ${D}/usr/share/tegaki/models/wagomu
	cp ${S}/tegaki-wagomu-japanese-0.3/handwriting-ja.{model,meta} ${D}/usr/share/tegaki/models/wagomu/
}

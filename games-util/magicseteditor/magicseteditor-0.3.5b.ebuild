# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


ESVN_REPO_URI="https://magicseteditor.svn.sourceforge.net/svnroot/magicseteditor/tags/releases/mse-${PV}-linux"
ESVN_PROJECT="magicseteditor"

inherit subversion eutils

DESCRIPTION='Magic Set Editor, also for Yu-Gi-Oh! and VS'
HOMEPAGE="http://magicseteditor.sourceforge.net/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="doc"

DEPEND=">=x11-libs/wxGTK-2.8"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_compile() {
	econf || die "configure failed: did you use 'eselect wxwidgets'?"
	emake || die "emake failed"
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodir /usr/share/${PN}/resource/tool
	dodir /usr/share/${PN}/resource/icon
	dodir /usr/share/${PN}/resource/cursor
	cp -R data "${D}/usr/share/${PN}/"
	cp ${S}/src/resource/common/* ${D}/usr/share/${PN}/resource/
	cp ${S}/src/resource/msw/tool/* ${D}/usr/share/${PN}/resource/tool/
	cp ${S}/src/resource/msw/icon/* ${D}/usr/share/${PN}/resource/icon/
	cp ${S}/src/resource/msw/cursor/* ${D}/usr/share/${PN}/resource/cursor/
	cp ${S}/src/resource/msw/other/* ${D}/usr/share/${PN}/resource/
	mv ${D}/usr/share/${PN}/data/magic-new.mse-style/imagemask_standard.PNG ${D}/usr/share/${PN}/data//magic-new.mse-style/imagemask_standard.png
	mv ${D}/usr/share/${PN}/data/magic-new-planeswalker.mse-style/border_mask.PNG ${D}/usr/share/${PN}/data/magic-new-planeswalker.mse-style/border_mask.png
	mv ${D}/usr/share/${PN}/data/magic-planeshifted.mse-style/imagemask_standard.PNG ${D}/usr/share/${PN}/data/magic-planeshifted.mse-style/imagemask_standard.png
	mv ${D}/usr/share/${PN}/data/vs-alter.mse-style/card-sample.PNG ${D}/usr/share/${PN}/data/vs-alter.mse-style/card-sample.png
	dodoc COPYING
	dodoc TODO
	newdoc doc/README README
	use doc && dohtml -r doc/*
	make_desktop_entry /usr/bin/magicseteditor "Magic Set Editor 2"
}

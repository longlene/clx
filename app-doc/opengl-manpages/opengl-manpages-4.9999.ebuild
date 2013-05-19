# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator subversion

MY_MAJOR_V=$(get_major_version)
if [[ "${MAJOR_V}" != "2" ]] ; then
	REPO_EXTRA_V="${MY_MAJOR_V}"
fi

DESCRIPTION="OpenGL man pages"
HOMEPAGE="http://www.opengl.org/wiki/Getting_started/XML_Toolchain_and_Man_Pages"
ESVN_REPO_URI="https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/docs/man${REPO_EXTRA_V}"

LICENSE="SGI-B-2.0"
SLOT="0"
KEYWORDS=""
IUSE="+man html"

DEPEND="dev-libs/libxslt
	app-text/docbook-mathml-dtd
	html? ( dev-lang/perl )
	man? ( app-text/docbook-xsl-stylesheets )"
RDEPEND="man? ( virtual/man )"

src_prepare() {
	if use man ; then
		einfo "Fixing author ..."

		for f in gl*.xml; do
			xsltproc --nonet -o fixed-"${f}" \
				"${FILESDIR}"/fix-author-manual-manvol.xsl \
				"${f}" || die
			mv fixed-"${f}" "${f}" || die
		done
	fi
}

src_compile() {
	if use man ; then
		einfo "Compiling manual ..."

		for f in gl*.xml; do
			xsltproc --nonet --noout \
				/usr/share/sgml/docbook/xsl-stylesheets/manpages/docbook.xsl \
				"${f}" || die
		done
	fi

	if use html ; then
		einfo "Compiling html manual ..."

		emake ROOT="${S}" || die "Failed creating html manual"
		perl xhtml/makeindex.pl "${S}"/xhtml "${S}" > "${S}"/xhtml/index.html || die "Failed generating html manual index"
	fi
}

src_install() {
	if use man ; then
		doman *.3 || die
	fi

	if use html ; then
		dohtml -a xml,html "${S}"/xhtml/* || die
	fi
}

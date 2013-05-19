# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: "BAUER Samuel <samuel.bauer@yahoo.fr>" $

EAPI="2"

inherit subversion

DESCRIPTION="OpenGL man pages"
HOMEPAGE="https://cvs.khronos.org/"
ESVN_REPO_URI="https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/docs/man/"

LICENSE="SGI-B-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+man html"

DEPEND="dev-libs/libxslt
		app-text/docbook-xml-dtd
		app-text/docbook-mathml-dtd
		html? ( dev-lang/perl )
		man? ( app-text/docbook-xsl-stylesheets )"
RDEPEND="man? ( virtual/man )"

src_compile() {
	if use man; then
		einfo "Compiling manual"

		for document in gl*.xml; do
			xsltproc --nonet -o tmp.xml \
				"${FILESDIR}"/fix-author-manual.xsl \
				"${document}" || die
			xsltproc --nonet -noout \
				/usr/share/sgml/docbook/xsl-stylesheets/manpages/docbook.xsl \
				tmp.xml || die
		done
	fi

	if use html; then
		einfo "Compiling html manual"

		emake ROOT="${S}" || die "Failed creating html manuals"
		perl xhtml/makeindex.pl ${S}/xhtml ${S} > ${S}/xhtml/index.html || die "Failed generating html manuals index"
	fi
}

src_install() {
	if use man; then
		einfo "Installing man page"

		doman *.3G || die "Cannot install man pages"
	fi

	if use html; then
		einfo "Installing html manual"

		dohtml -a xml,html ${S}/xhtml/* || die "Cannot install html pages"
	fi

	dodoc ${S}/README.txt
}

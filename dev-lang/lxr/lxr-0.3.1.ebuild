# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp

S=${WORKDIR}/${P%.?}

DESCRIPTION="A general purpose source code indexer and cross-referencer that provides web-based browsing of source code with links to the definition and usage of any identifier."
HOMEPAGE="http://sourceforge.net/projects/lxr"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

RESTRICT="nomirror"
IUSE=""

# Glimpse is actually optional, but since there is no USE flag, require it
RDEPEND="app-misc/glimpse
	     dev-lang/perl"
DEPEND=${RDEPEND}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	# Install documentation
	dodoc COPYING INSTALL README

	# Makefile macros
	PERLBIN=`which perl`
	INSTALLPREFIX=${MY_HTDOCSDIR}

	# Install
	make install INSTALLPREFIX=${INSTALLPREFIX} PERLBIN=${PERLBIN}

	# Identify the configuration files that this app uses
	webapp_configfile ${MY_HTDOCSDIR}/http/lxr.conf

	# Identify any script files that need #! headers adding to run under
	# a CGI script (such as PHP/CGI)
	for x in find ident search diff source; do
		webapp_runbycgibin perl ${MY_HTDOCSDIR}/http/$x
	done

	# Add the post-installation instructions
	webapp_postinst_txt en INSTALL

	# Fix perms on genxref
	chmod o+rx ${MY_HTDOCSDIR}/bin/genxref

	# Let webapp.eclass do the rest
	webapp_src_install
}


# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Reader for RSS/RDF/Atom Newsfeeds"
HOMEPAGE="http://www.rssowl.org"
SRC_URI="
	x86?	( mirror://sourceforge/rssowl/rssowl-${PV}.linux.zip )
	amd64?	( mirror://sourceforge/rssowl//rssowl-${PV}.linux.x86_64.zip )"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jre-1.5.0"

src_unpack()
{
	unpack ${A}
}

src_install()
{
	dodir /opt/
        insinto /opt/
        doins -r ${WORKDIR}/* || die "Install failed!" 
	dosym /opt/rssowl/RSSOwl /usr/bin/

}

pkg_postinst()
{
	chmod +x /opt/rssowl/RSSOwl
}
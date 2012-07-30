# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="A TV program schedule viewer and a Personal Video Recorder GUI"
HOMEPAGE="http://gshowtv.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-lang/perl
	media-tv/xmltv
	dev-perl/XML-Twig
	dev-perl/glib-perl
	dev-perl/gtk2-perl
	dev-perl/gtk2-gladexml
	dev-perl/Locale-gettext
	media-tv/xmltv-druid
	dev-perl/libintl-perl"

S=${WORKDIR}/${PN}

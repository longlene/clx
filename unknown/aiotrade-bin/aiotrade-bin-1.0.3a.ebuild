# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="AIOTrade (formerly Humai Trader Platform) is a free, open source stock technical analysis platform built on pure java."
HOMEPAGE="http://aiotrade.com/"
SRC_URI="http://nchc.dl.sourceforge.net/project/humaitrader/aiotrade/aiotrade-1.0.3a/aiotrade-bin-1.0.3a.zip"
RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="virtual/jre"
DEPEND=$RDEPEND

src_install()
{
	mkdir $D/opt
	mv $WORKDIR/aiotrade $D/opt
	chmod -R o+rx $D/opt/aiotrade
	rm $D/opt/aiotrade/bin/*.exe
	mkdir -p $D/usr/bin
	ln -s /opt/aiotrade/bin/aiotrade $D/usr/bin/aiotrade
	einfo "To run the program type aiotrade in terminal"
}
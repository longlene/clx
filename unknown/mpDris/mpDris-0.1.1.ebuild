# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit python eutils distutils

DESCRIPTION="An implementation of the XMMS2 media player interface MPRIS as a
client for MPD"
HOMEPAGE="http://ayeon.org/projects/mpDris/"
SRC_URI="http://ayeon.org/projects/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

DEPEND=">=dev-lang/python-2.4
		>=dev-python/dbus-python-0.80
		>=dev-python/pygobject-2.14
		>=dev-python/python-mpd-0.2.0"


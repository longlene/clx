# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="A program for automatically retrieving extra information for songs"
HOMEPAGE="http://kapheine.hypa.net/musicextras/"
SRC_URI="http://kapheine.hypa.net/musicextras/musicextras-0.6.5.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE="musicextras-gui"
USE_RUBY="any"
DEPEND=">=ruby-1.8.2
	>=ruby-mp3info-0.3
	nls? ( >=ruby-gettext-0.8.0 )
	gnome? ( >=ruby-gnome2-0.10.1 )
"

RDEPEND="musicextras-gui? (>=dev-ruby/ruby-libglade2-0.10.1)"



# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="access mythtv recordings via FUSE"
HOMEPAGE="http://outflux.net/software/pkgs/mythtvfs-fuse/"
SRC_URI="http://outflux.net/software/pkgs/mythtvfs-fuse/download/mythtvfs-fuse-0.6.0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=">=sys-fs/fuse-2.2
	media-tv/mythtv"

src_install()
{
	einstall
}

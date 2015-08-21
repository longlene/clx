# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="pianod is a music player with line-oriented and Websocket TCP/IP control interfaces"
HOMEPAGE="http://deviousfish.com/pianod/"
SRC_URI="http://deviousfish.com/Downloads/pianod/pianod-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
media-libs/libao
dev-libs/libgcrypt
net-libs/gnutls
dev-libs/json-c
|| ( media-libs/faad2 media-libs/libmad )
"
RDEPEND="${DEPEND}"

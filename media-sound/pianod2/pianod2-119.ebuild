# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="pianod2 is an open-source, multi-source network-controlled music player for use as central music server"
HOMEPAGE="http://deviousfish.com/pianod2/"
SRC_URI="http://deviousfish.com/Downloads/pianod2/Devel/pianod2-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="extra"

DEPEND="
media-libs/libao
|| ( media-video/ffmpeg media-video/libav )
extra? ( dev-libs/libgcrypt
net-libs/gnutls
dev-libs/json-c )
media-libs/taglib
"
RDEPEND="${DEPEND}"

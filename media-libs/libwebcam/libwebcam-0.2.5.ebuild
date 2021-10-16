# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit cmake

DESCRIPTION="The webcam-tools package"
HOMEPAGE="http://sourceforge.net/projects/libwebcam/"
SRC_URI="mirror://sourceforge/libwebcam/libwebcam-src-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-libs/libxml2"
RDEPEND="${DEPEND}"

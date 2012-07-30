# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="ProFont - The ultimate programming font."
HOMEPAGE="http://www.tobias-jung.de/seekingprofont/"
SRC_URI="http://www.tobiasjung.net/dl/${PN}.tar.gz"
LICENSE="as-is"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE="gzip"

DEPEND="gzip? ( app-arch/gzip )"
RDEPEND=""

S="${WORKDIR}/${PN}"
FONT_S="${S}"
FONT_SUFFIX="pcf"

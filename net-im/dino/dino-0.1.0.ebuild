# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Modern XMPP Chat client using GTK+/Vala"
HOMEPAGE="https://dino.im/"
SRC_URI="https://github.com/dino/dino/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/gtk+
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/vala
"

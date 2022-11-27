# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ecm

DESCRIPTION="Plasma 5 applet for displaying weather information from yr.no server"
HOMEPAGE="https://github.com/kotelnik/plasma-applet-weather-widget"
SRC_URI="https://github.com/kotelnik/plasma-applet-weather-widget/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=kde-frameworks/plasma-5.60.0:5
"
RDEPEND="${DEPEND}"
BDEPEND=""


# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ecm vcs-snapshot

EGIT_COMMIT="c036ce5e981a3daddb15917790efbf6b51ead454"

DESCRIPTION="Plasma 5 applet that shows the current window appmenu"
HOMEPAGE="https://github.com/joka90/plasma-applet-window-appmenu"
SRC_URI="https://github.com/joka90/plasma-applet-window-appmenu/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=kde-frameworks/plasma-5.60.0:5
"
RDEPEND="${DEPEND}"
BDEPEND=""


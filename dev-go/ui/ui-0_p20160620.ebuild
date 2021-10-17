# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/andlabs/ui"
EGIT_COMMIT="2dde2a79e7020f065d94d9bc17e0191bf18a5bff"

DESCRIPTION="Platform-native GUI library for Go"
HOMEPAGE="https://github.com/andlabs/ui"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	x11-libs/gtk+:3
"
RDEPEND="${DEPEND}"

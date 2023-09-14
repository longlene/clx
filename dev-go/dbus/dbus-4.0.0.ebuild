# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8
EGO_PN="github.com/godbus/dbus"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Native Go bindings for D-Bus"
HOMEPAGE="https://github.com/godbus/dbus"
SRC_URI="https://github.com/godbus/dbus/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	sys-apps/dbus
"
RDEPEND="${DEPEND}"

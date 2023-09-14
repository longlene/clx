# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit autotools

DESCRIPTION="A microframework for C based on GLib and bad intentions"
HOMEPAGE="https://balde.rgm.io/"
SRC_URI="https://github.com/balde/balde/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	dev-libs/fcgi
	dev-libs/glib
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

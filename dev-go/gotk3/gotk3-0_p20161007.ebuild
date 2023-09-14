# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/gotk3/gotk3/..."
EGIT_COMMIT="457604167e1c97a30e457ff894708cf086e2707d"

DESCRIPTION="Go bindings for GTK3"
HOMEPAGE="https://github.com/gotk3/gotk3"
SRC_URI="https://github.com/gotk3/gotk3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	x11-libs/gtk+:3
	dev-libs/glib:2
	>=x11-libs/cairo-1.10
"
RDEPEND="${DEPEND}"

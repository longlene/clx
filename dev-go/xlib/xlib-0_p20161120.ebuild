# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/vbsw/xlib"
EGIT_COMMIT="e992d862dfe25ea6407ecbd4d6a06673e4861a1f"

DESCRIPTION="Xlib binding for the programming language Go"
HOMEPAGE="https://github.com/vbsw/xlib"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/xkg.v0"

DESCRIPTION="X Keyboard Grabber"
HOMEPAGE="https://github.com/go-xkg/xkg"
SRC_URI="https://github.com/go-xkg/xkg/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libXi
"
RDEPEND="${DEPEND}"

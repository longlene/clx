# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/BurntSushi/xdg"
EGIT_COMMIT="e80d3446fea190e21fbd294569844f066e47ccfc"

DESCRIPTION="A Go package for reading config and data files according to the XDG Base Directory specification"
HOMEPAGE="https://github.com/BurntSushi/xdg"
SRC_URI="https://github.com/BurntSushi/xdg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

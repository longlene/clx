# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/xo/terminfo"
EGIT_COMMIT="64402cba454eb024d6458571cc4fb372ff7173a6"

DESCRIPTION="A terminfo package in pure go!"
HOMEPAGE="https://github.com/xo/terminfo"
SRC_URI="https://github.com/xo/terminfo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

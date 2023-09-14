# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/droundy/goopt"
EGIT_COMMIT="17f16b1df30b00550475f4bf7da2d83f9a09223f"

DESCRIPTION="getopt-like flags package for golang"
HOMEPAGE="https://github.com/droundy/goopt"
SRC_URI="https://github.com/droundy/goopt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

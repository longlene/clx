# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tidwall/redcon"
EGIT_COMMIT="6f1afba0174494ee24921d0fd9b4af5144fd0169"

DESCRIPTION="Fast Redis compatible server framework for Go"
HOMEPAGE="https://github.com/tidwall/redcon"
SRC_URI="https://github.com/tidwall/redcon/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

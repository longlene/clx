# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/BurntSushi/xgb"
EGIT_COMMIT="27f122750802c950b2c869a5b63dafcf590ced95"

DESCRIPTION="The X Go Binding is a low-level API to communicate with the X server"
HOMEPAGE="https://github.com/BurntSushi/xgb"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/brutella/can/..."
EGIT_COMMIT="4e5f241355de3da474d17b24f5971fe2160b1eeb"

DESCRIPTION="Connect to a CAN bus in Go"
HOMEPAGE="https://github.com/brutella/can"
SRC_URI="https://github.com/brutella/can/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
}

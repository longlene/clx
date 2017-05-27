# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/Harvey-OS/ninep/..."
EGIT_COMMIT="61926292e9fe4a2c5d432b6ab40fe5b7432fa272"

DESCRIPTION="Package for implementing clients and servers of the 9P and 9P2000 distributed resource protocols in Go"
HOMEPAGE="https://github.com/Harvey-OS/ninep"
SRC_URI="https://github.com/Harvey-OS/ninep/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

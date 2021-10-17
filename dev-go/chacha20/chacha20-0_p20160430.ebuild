# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/Yawning/chacha20"
EGIT_COMMIT="c91e78db502ff629614837aacb7aa4efa61c651a"

DESCRIPTION="Golang ChaCha20 stream cipher"
HOMEPAGE="https://github.com/Yawning/chacha20"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

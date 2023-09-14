# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mdp/rsc/..."
EGIT_COMMIT="90f07065088deccf50b28eb37c93dad3078c0f3c"

DESCRIPTION="RSC mirror of the QR code"
HOMEPAGE="https://github.com/mdp/rsc"
SRC_URI="https://github.com/mdp/rsc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-gfx/qrencode
"
RDEPEND="${DEPEND}"

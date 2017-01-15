# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/cznic/mathutil/..."
EGIT_COMMIT="4609a45a9e61188d0d69a5d8ad42600c3df35002"

DESCRIPTION="Utilities supplemental to the Go standard \"rand\" and \"math\" packages"
HOMEPAGE="https://github.com/cznic/mathutil"
SRC_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/bigfft
"
RDEPEND="${DEPEND}"

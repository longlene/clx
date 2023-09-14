# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/cznic/fileutil/..."
EGIT_COMMIT="e618435e3202890725c12ccff676e9e3b2592c71"

DESCRIPTION="Package fileutil collects some file utility functions"
HOMEPAGE="https://github.com/cznic/fileutil"
SRC_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/mathutil
"
RDEPEND="${DEPEND}"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/cznic/strutil"
EGIT_COMMIT="1eb03e3cc9d345307a45ec82bd3016cde4bd4464"

DESCRIPTION="Package strutil collects utils supplemental to the standard strings package"
HOMEPAGE="https://github.com/cznic/strutil"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

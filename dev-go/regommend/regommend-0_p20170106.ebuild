# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/muesli/regommend"
EGIT_COMMIT="42393ef55111429533a87af04d6a1a3b153bee02"

DESCRIPTION="Recommendation engine for Go"
HOMEPAGE="https://github.com/muesli/regommend"
SRC_URI="https://github.com/muesli/regommend/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/cznic/sortutil"
EGIT_COMMIT="4c7342852e65c2088c981288f2c5610d10b9f7f4"

DESCRIPTION="Utilities supplemental to the Go standard \"sort\" package"
HOMEPAGE="https://github.com/cznic/sortutil"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

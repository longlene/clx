# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/edsrzf/mmap-go"
EGIT_COMMIT="935e0e8a636ca4ba70b713f3e38a19e1b77739e8"

DESCRIPTION="A portable mmap package for Go"
HOMEPAGE="https://github.com/edsrzf/mmap-go"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

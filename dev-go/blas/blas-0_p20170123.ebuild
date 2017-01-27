# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/gonum/blas"
EGIT_COMMIT="34a5cb24f900bb4f059b51aa300aed4da4437d0c"

DESCRIPTION="A BLAS implementation for Go"
HOMEPAGE="https://github.com/gonum/blas"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	virtual/blas
"
RDEPEND="${DEPEND}"

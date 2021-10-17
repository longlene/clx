# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/cstockton/go-iter"
EGIT_COMMIT="353ca660c5db366129be2acc4c4c6807185474e9"

DESCRIPTION="Package iter provides primitives for walking arbitrary data structures"
HOMEPAGE="https://github.com/cstockton/go-iter"
SRC_URI="https://github.com/cstockton/go-iter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

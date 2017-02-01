# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/hideo55/go-popcount"
EGIT_COMMIT="595b756335658a52da3522b464ee1ef1f17679c2"

DESCRIPTION="PopCount implementation for Go"
HOMEPAGE="https://github.com/hideo55/go-popcount"
SRC_URI="https://github.com/hideo55/go-popcount/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

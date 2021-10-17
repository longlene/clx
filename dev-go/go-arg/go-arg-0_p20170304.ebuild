# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/kenshaw/go-arg"
EGIT_COMMIT="d4c2b35b2ef5b67c3ec6f904cea0dff806d51e2c"

DESCRIPTION="Struct-based argument parsing in Go"
HOMEPAGE="https://github.com/kenshaw/go-arg"
SRC_URI="https://github.com/kenshaw/go-arg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

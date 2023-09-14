# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="golang.org/x/image/..."
EGIT_COMMIT="1ff62c92167a10494f3e0b1e77cb67860a6ac43a"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/golang/image/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


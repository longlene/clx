# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/libreoscar/gomdb"
EGIT_COMMIT="b5ddcb996a7a4dc40b9bfdac447dd41b9205f03c"

DESCRIPTION="Go wrapper for LMDB"
HOMEPAGE="https://github.com/libreoscar/gomdb"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

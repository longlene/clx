# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/huichen/murmur"
EGIT_COMMIT="e0489551cf5116e27d7cc69d97a53cdbdd028acf"

DESCRIPTION="Go Murmur3 hash implementation"
HOMEPAGE="https://github.com/huichen/murmur"
SRC_URI="https://github.com/huichen/murmur/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

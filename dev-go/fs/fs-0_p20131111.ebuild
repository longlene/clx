# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/kr/fs"
EGIT_COMMIT="2788f0dbd16903de03cb8186e5c7d97b69ad387b"

DESCRIPTION="Package fs provides filesystem-related functions"
HOMEPAGE="https://github.com/kr/fs"
SRC_URI="https://github.com/kr/fs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

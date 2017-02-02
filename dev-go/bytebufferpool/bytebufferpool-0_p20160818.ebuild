# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/valyala/bytebufferpool"
EGIT_COMMIT="e746df99fe4a3986f4d4f79e13c1e0117ce9c2f7"

DESCRIPTION="Anti-memory-waste byte buffer pool"
HOMEPAGE="https://github.com/valyala/bytebufferpool"
SRC_URI="https://github.com/valyala/bytebufferpool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

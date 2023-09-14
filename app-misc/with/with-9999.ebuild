# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="Command prefixing for continuours workflow using a single tool"
HOMEPAGE="https://github.com/mchav/with"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mchav/with.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin with
	dodoc README.md
}

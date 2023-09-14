# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="A bounded single-producer single-consumer wait-free and lock-free queue"
HOMEPAGE="https://github.com/rigtorp/SPSCQueue"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rigtorp/SPSCQueue.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins ${PN}.h
	dodoc README.md
}

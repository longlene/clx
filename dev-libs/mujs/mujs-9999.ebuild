# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="An embeddable Javascript interpreter in C"
HOMEPAGE="http://mujs.com/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ccxvii/mujs.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake prefix="${D}"/usr install
}

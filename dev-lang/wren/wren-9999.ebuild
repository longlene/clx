# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="The Wren Programming Language"
HOMEPAGE="https://github.com/munificent/wren"
SRC_URI=""

EGIT_REPO_URI="https://github.com/munificent/wren.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin wren
}

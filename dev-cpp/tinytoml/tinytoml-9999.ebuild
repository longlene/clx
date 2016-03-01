# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A header only C++11 library for parsing TOML"
HOMEPAGE="https://github.com/mayah/tinytoml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mayah/tinytoml.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r include
	dodoc README.md
}

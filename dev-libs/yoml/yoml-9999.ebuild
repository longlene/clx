# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="YAML Object Model Layer - a DOM-like interface for YAML"
HOMEPAGE="https://github.com/h2o/yoml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/h2o/yoml.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/libyaml"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins yoml.h yoml-parser.h
	dodoc README.md
}

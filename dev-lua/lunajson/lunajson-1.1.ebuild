# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit lua

DESCRIPTION="A strict and fast JSON parser/decoder/encoder written in pure Lua"
HOMEPAGE="https://github.com/grafi-tt/lunajson"
SRC_URI="https://github.com/grafi-tt/lunajson/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r src/*
	dodoc README.md
}

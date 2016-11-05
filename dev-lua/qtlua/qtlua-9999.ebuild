# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="Lua interface to QT library"
HOMEPAGE="https://github.com/torch/qtlua"
SRC_URI=""

EGIT_REPO_URI="https://github.com/torch/qtlua.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtsvg:4
	dev-lang/lua
"
RDEPEND="${DEPEND}"

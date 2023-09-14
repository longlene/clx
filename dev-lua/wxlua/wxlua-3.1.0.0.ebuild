# Copyright 1999-2008 Gentoo Foundation

EAPI=8

inherit cmake

DESCRIPTION="Lua bindings for wxWidgets cross-platform GUI toolkit"
HOMEPAGE="https://github.com/pkulchenko/wxlua"
SRC_URI="https://github.com/pkulchenko/wxlua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="wxWinFDL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="opengl"

DEPEND=">=dev-lang/lua-5.1
	>=x11-libs/wxGTK-2.8.7.0
	opengl? ( virtual/opengl )"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}/wxLua"


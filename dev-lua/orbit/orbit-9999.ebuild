# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="4"

inherit multilib eutils git-2

DESCRIPTION="MVC Web Framework for Lua"
HOMEPAGE="https://github.com/keplerproject/orbit"
SRC_URI=""

EGIT_REPO_URI="git://github.com/msva/orbit.git https://github.com/msva/orbit.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="luajit doc"

RDEPEND=" || ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
	dev-lua/wsapi
	dev-lua/cosmo"
DEPEND="${RDEPEND}"

src_prepare() {
	use luajit && \
	sed -e "s%#!.*lua$%#!/usr/bin/env luajit%g" \
	-i src/launchers/ob{.cgi,.fcgi} src/launchers/orbit
}

src_configure() {
	LUA="lua";
	use luajit && LUA="luajit"
	cd "${S}"
	./configure "${LUA}"
}

src_install() {
        docompress -x /usr/share/doc
	emake DESTDIR="${D}" install || die "Can't install Orbit"
        use doc && (
                insinto /usr/share/doc/${PF}/examples
                doins -r samples/*
                insinto /usr/share/doc/${PF}
                doins -r doc/*
        )

#emake DESTDIR="${D}" PREFIX="/usr/share/doc/${P}" install-doc install-samples
}

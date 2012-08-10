# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="4"

inherit multilib eutils git-2

DESCRIPTION="Lua WSAPI Library"
HOMEPAGE="https://github.com/keplerproject/wsapi"
SRC_URI=""

#s/msva/keplerproject/ somewhen in the future
EGIT_REPO_URI="git://github.com/msva/wsapi.git https://github.com/msva/wsapi.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="luajit doc"
#TODO: xavante"
RDEPEND=" || ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
	luajit? ( dev-lang/luajit:2 )
	dev-libs/fcgi
	virtual/httpd-fastcgi
	dev-lua/rings
	dev-lua/coxpcall"
#TODO:	xavante? ( dev-lua/xavante )"
DEPEND="${RDEPEND}"

src_prepare() {
	use luajit && \
	sed -e "s///g" -e "s%#!.*lua$%#!/usr/bin/env luajit%g" \
	-i src/launcher/wsapi{,.cgi,.fcgi}
}

src_configure() {
	LUA="lua";
	use luajit && LUA="luajit"
	cd "${S}"
	./configure "${LUA}"
}

src_compile() {
	use luajit && INC="-I/usr/include/luajit-2.0/"
	emake DESTDIR="${D}" CC="$(tc-getCC) -fPIC -DPIC" LDFLAGS="${LDFLAGS}" INC="${INC}" CFLAGS="${CFLAGS}" || die "Can't copmile Lua-FCGI library"
}

src_install() {
        docompress -x /usr/share/doc
	emake DESTDIR="${D}" install
	emake DESTDIR="${D}" install-fcgi
        use doc && (
                insinto /usr/share/doc/${PF}/examples
                doins -r samples/*
                insinto /usr/share/doc/${PF}
                doins -r doc/*
        )

#emake DESTDIR="${D}" PREFIX="/usr/share/doc/${P}" install-doc install-samples
}

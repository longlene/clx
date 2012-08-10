# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="4"

inherit multilib eutils git-2

DESCRIPTION="safe-template engine for lua"
HOMEPAGE="https://github.com/mascarenhas/cosmo"
SRC_URI=""

EGIT_REPO_URI="git://github.com/msva/cosmo.git https://github.com/msva/cosmo.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc"

RDEPEND=" || ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )"
DEPEND="${RDEPEND}"

src_configure() {
	LUA="lua";
	./configure "${LUA}"
}

src_install() {
	docompress -x /usr/share/doc
	emake DESTDIR="${D}" install || die "Can't install Cosmo"
        use doc && (
                insinto /usr/share/doc/${PF}/examples
                doins -r samples/*
                insinto /usr/share/doc/${PF}
                doins -r doc/*
        )

#emake DESTDIR="${D}" PREFIX="/usr/share/doc/${P}" install-doc install-samples
}

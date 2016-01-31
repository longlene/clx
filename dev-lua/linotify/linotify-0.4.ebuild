# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

inherit autotools eutils

DESCRIPTION="inotify bindings for Lua"
HOMEPAGE="https://github.com/hoelzro/linotify"
SRC_URI="https://github.com/hoelzro/linotify/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="luajit"

RDEPEND="|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )"
DEPEND="${RDEPEND}
	luajit? ( dev-lang/luajit:2 )"

src_prepare() {
	epatch_user
}

src_compile() {
	LUAPKG_CMD="lua";
	use luajit && LUAPKG_CMD="luajit";
	export LUAPKG_CMD;
	emake \
	CFLAGS="${CFLAGS} $($(tc-getPKG_CONFIG) ${LUAPKG_CMD} --cflags) -fPIC -O3 -Wall" \
	|| die "emake failed"
}

src_install() {
	insinto /usr/share/doc/"${P}";
	doins README.md
	emake install \
	DESTDIR="${D}" \
	INSTALL_PATH="$($(tc-getPKG_CONFIG) ${LUAPKG_CMD} --variable=INSTALL_CMOD)" \
	|| die "emake failed"
}

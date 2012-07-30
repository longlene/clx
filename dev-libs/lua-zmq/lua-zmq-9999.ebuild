# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit flag-o-matic git

DESCRIPTION="Lua bindings for zeromq."
HOMEPAGE="http://www.zeromq.org/bindings:lua"
EGIT_REPO_URI="git://github.com/iamaleksey/${PN}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/lua-5.1
	dev-libs/zeromq"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	sed -i -e "s#^INSTALL_PATH = .*\$#INSTALL_PATH = \$(DESTDIR)/$(pkg-config --variable INSTALL_CMOD lua)#" "${S}/Makefile"
	sed -i -e "s#^CFLAGS = .*##" "${S}/Makefile"
}

src_compile() {
	append-flags -fPIC -c $(pkg-config --cflags lua)
	emake CFLAGS="${CFLAGS}" all || die
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

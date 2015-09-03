# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The Howl Editor"
HOMEPAGE="http://howl.io"
SRC_URI="https://github.com/howl-editor/howl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
x11-libs/gtk+:3
net-misc/wget
"

src_compile() {
	make -C src all || die "compile failed"
}

src_install() {
	make -C src DESTDIR="${D}" PREFIX=/usr install || die "install failed"
}

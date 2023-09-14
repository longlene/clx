# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Graphical User Interfaces"
HOMEPAGE="http://pipeglade.boundp.org"
SRC_URI="https://github.com/trebb/pipeglade/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-3.14.6"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/!=/?=/' Makefile
	sed -i '/VERSION/d' Makefile
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
}

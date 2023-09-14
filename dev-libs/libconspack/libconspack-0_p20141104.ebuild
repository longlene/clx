# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="2b30e51107013f1e58bbcc008d33c1cc1116cd5e"

DESCRIPTION="Conspack implementation for C"
HOMEPAGE="https://github.com/conspack/libconspack"
SRC_URI="https://github.com/conspack/libconspack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	./autogen
	econf --prefix=/usr || die "configure failed"
}

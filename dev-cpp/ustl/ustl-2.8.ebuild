# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit multilib

DESCRIPTION="A size-optimized STL implementation"
HOMEPAGE="http://msharov.github.io/ustl"
SRC_URI="https://github.com/msharov/ustl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's#-Os##' Config.mk.in
}

src_install() {
	emake DEST="${D}" INCDIR="${D}"/usr/include LIBDIR="${D}"/usr/$(get_libdir) BINDIR="${D}"/usr/bin install || die "install failed"
	dodoc README
}

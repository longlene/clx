# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="The ABI Generic Analysis and Instrumentation Library"
HOMEPAGE="https://www.sourceware.org/libabigail/"
SRC_URI="http://mirrors.kernel.org/sourceware/libabigail/libabigail-${PV}.tar.gz"

LICENSE="LLGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/elfutils
dev-libs/libxml2"

RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/redhat/d' build-aux/ltmain.sh
}

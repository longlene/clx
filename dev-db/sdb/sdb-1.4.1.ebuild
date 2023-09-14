# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="simple and fast string based key-value database with support for arrays and json"
HOMEPAGE="https://github.com/radareorg/sdb"
SRC_URI="https://github.com/radareorg/sdb/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i "/LIBDIR=/{s#lib#$(get_libdir)#}" config.mk
}

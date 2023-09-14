# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="A high-performance path dispatching library"
HOMEPAGE="https://github.com/c9s/r3"
SRC_URI="https://github.com/c9s/r3/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

#TODO enable graphviz, json

src_prepare() {
	default
	eautoreconf
}

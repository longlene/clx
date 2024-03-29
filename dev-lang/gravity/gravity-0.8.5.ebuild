# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Gravity Programming Language"
HOMEPAGE="http://gravity-lang.org"
SRC_URI="https://github.com/marcobambini/gravity/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#src_install() {
#	dobin ${BUILD_DIR}/bin/${PN}
#	dodoc README.md
#}

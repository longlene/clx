# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A lightweight C++ machine learning library for embedded electronics and robotics"
HOMEPAGE="http://fidoproject.github.io/"
SRC_URI="https://github.com/FidoProject/Fido/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake PREFIX="${D}"/usr install
}

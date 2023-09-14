# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="a36d44db1827a36bbd3868825c1b82d23f10e491"

DESCRIPTION="C++ binding for nanomsg"
HOMEPAGE="https://github.com/nanomsg/cppnanomsg"
SRC_URI="https://github.com/nanomsg/cppnanomsg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/nanomsg"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins nn.hpp
	dodoc README
}

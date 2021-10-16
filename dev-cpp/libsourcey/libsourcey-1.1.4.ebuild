# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="C++11 evented IO for realtime video streaming and high performance networking applications"
HOMEPAGE="http://sourcey.com/libsourcey"
SRC_URI="https://github.com/sourcey/libsourcey/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "s#DESTINATION lib#DESTINATION $(get_libdir)#" cmake/LibSourceyModules.cmake
}

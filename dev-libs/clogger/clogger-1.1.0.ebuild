# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A C logging library based on Python's logbook"
HOMEPAGE="http://clogger.readthedocs.org/"
SRC_URI="https://github.com/dcreager/clogger/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/libcork
dev-libs/check
"

src_prepare() {
	eapply_user
	sed -e "s#git describe#echo ${PV}#" \
		-e 's#git rev-parse HEAD#echo 1#' \
		-e '/if(GIT_SHA1/,/endif(GIT_SHA1/d' \
		-i CMakeLists.txt
}


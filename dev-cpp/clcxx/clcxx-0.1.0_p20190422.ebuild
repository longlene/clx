# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="fae2bab7191775735f1d2c921f448995acff7307"

DESCRIPTION="Expose C++ libraries in common lisp"
HOMEPAGE="https://github.com/Islam0mar/CLCXX"
SRC_URI="https://github.com/Islam0mar/CLCXX/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/set(CMAKE_INSTALL_LIBDIR/{s#lib#$(get_libdir)#}" CMakeLists.txt
	cmake-utils_src_configure
}


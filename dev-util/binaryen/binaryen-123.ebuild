# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit cmake python-any-r1 toolchain-funcs

DESCRIPTION="Compiler infrastructure and toolchain library for WebAssembly"
HOMEPAGE="https://github.com/WebAssembly/binaryen"
SRC_URI="
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-version_${PV}


pkg_setup() {
	export CC=$(tc-getCC)
	export CXX=$(tc-getCXX)
	einfo
	einfo "CC:\t${CC}"
	einfo "CXX:\t${CXX}"
	einfo
	python-any-r1_pkg_setup
}

src_prepare() {
	sed -r -i \
		-e '/INSTALL.+src\/binaryen-c\.h/d' \
		"CMakeLists.txt" \
		|| die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_STATIC_LIB=OFF
		-DBUILD_TESTS=OFF
		-DCMAKE_INSTALL_BINDIR="${EPREFIX}/usr/$(get_libdir)/binaryen/${SLOT_MAJOR}/bin"
		-DCMAKE_INSTALL_INCLUDEDIR="${EPREFIX}/usr/$(get_libdir)/binaryen/${SLOT_MAJOR}/include"
		-DCMAKE_INSTALL_LIBDIR="${EPREFIX}/usr/$(get_libdir)/binaryen/${SLOT_MAJOR}/$(get_libdir)"
		-DENABLE_WERROR=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	insinto "/usr/$(get_libdir)/binaryen/${SLOT_MAJOR}/include"
	doins "${S}/src/"*".h"
	local hdir
	for hdir in "asmjs" "emscripten-optimizer" "ir" "support" ; do
		insinto "/usr/$(get_libdir)/binaryen/${SLOT_MAJOR}/include/${hdir}"
		doins "${S}/src/${hdir}/"*".h"
	done
	dosym \
		"/usr/$(get_libdir)/binaryen/${SLOT_MAJOR}/$(get_libdir)" \
		"/usr/$(get_libdir)/binaryen/${SLOT_MAJOR}/lib"
	dodoc "LICENSE"
	cat "third_party/llvm-project/include/llvm/Support/LICENSE.TXT" \
		> "${T}/LICENSE.LLVM_System_Interface_Library.TXT"
	dodoc "${T}/LICENSE.LLVM_System_Interface_Library.TXT"
	cat "third_party/llvm-project/include/llvm/LICENSE.TXT" \
		> "${T}/LICENSE.llvm-project.TXT"
	dodoc "${T}/LICENSE.llvm-project.TXT"
	local f
	for f in $(find "${ED}" -executable) ; do
		if ldd "${f}" 2>/dev/null | grep -q "libbinaryen.so" ; then
			patchelf \
				--set-rpath "${EPREFIX}/usr/$(get_libdir)/binaryen/${SLOT_MAJOR}/$(get_libdir)" \
				"${f}" \
				|| die
		fi
	done
}

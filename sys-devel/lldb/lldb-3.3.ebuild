# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} pypy{1_9,2_0} )

inherit cmake-utils eutils multilib python-r1

DESCRIPTION="LLDB is a next generation, high-performance debugger"
HOMEPAGE="http://lldb.llvm.org/"
SRC_URI="http://www.llvm.org/releases/3.3/lldb-${PV}.src.tar.gz"

# check http://lab.llvm.org:8011/builders/lldb-x86_64-linux/
# when build fails

LICENSE="UoI-NCSA"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug +python"

DEPEND="${PYTHON_DEPS}"
RDEPEND="~sys-devel/llvm-${PV}[debug=]
~sys-devel/clang-${PV}[debug=]
${PYTHON_DEPS}"

S="${WORKDIR}/lldb-${PV}.src"

src_prepare() {
	sed -i "s/lib/$(get_libdir)/" scripts/lldb_python_module.cmake
	# User patches
	epatch_user
}

src_configure() {
	if use debug; then
		CMAKE_BUILD_TYPE=RelWithDebInfo
		DEBUG_FLAGS="-DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_BACKTRACES=ON"
	else
		CMAKE_BUILD_TYPE=Release
		DEBUG_FLAGS="-DLLVM_ENABLE_ASSERTIONS=OFF -DLLVM_ENABLE_BACKTRACES=OFF"
	fi

	append-cxxflags "-std=c++11" || die
	append-ldflags "-Wl,-L`llvm-config --libdir`" || die

	local mycmakeargs="
	-DCMAKE_SYSTEM_NAME="Linux"
	-DCMAKE_INSTALL_PREFIX=${EPREFIX}/usr/
	-DLLDB_PATH_TO_LLVM_BUILD=${EPREFIX}/usr/
	-DLLDB_PATH_TO_CLANG_BUILD=${EPREFIX}/usr/
	-DSHARED_LIBRARY=ON
	${DEBUG_FLAGS}"

	# shared library hack
	sed -i 's/^.*Mach-O.*$//' source/Plugins/ObjectFile/CMakeLists.txt
	sed -i 's/^.*mach-core.*$//' source/Plugins/Process/CMakeLists.txt
	sed -i -e 's/lldbPluginObjectFileMachO//' -e 's/lldbPluginProcessMachCore//' \
		source/CMakeLists.txt

	# Setup the search path to include the Prefix includes
	if use prefix ; then
		mycmakeargs="${mycmakeargs} \
			-DC_INCLUDE_DIRS=${EPREFIX}/usr/include:/usr/include"
	fi

	if use amd64; then
		mycmakeargs="${mycmakeargs} -DLLVM_LIBDIR_SUFFIX=64/llvm \
			-DLLVM_ENABLE_PIC=ON"
	else
		mycmakeargs="${mycmakeargs} -DLLVM_LIBDIR_SUFFIX=/llvm"
	fi

	# build with a suitable Python version
	python_export_best
	! use python && \
		mycmakeargs="${mycmakeargs} -DLLDB_DISABLE_PYTHON=1"

	# clang prefers clang over gcc, so we may need to force that
	tc-export CC CXX
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	rm ${D}/usr/lib/liblldb.so*
	if use python; then
		mv ${BUILD_DIR}/$(get_libdir)/python* ${D}/usr/$(get_libdir)/
		dosym /usr/$(get_libdir)/python2.7/site-packages/lldb/_lldb.so \
			/usr/$(get_libdir)/llvm/liblldb.so
	fi
}

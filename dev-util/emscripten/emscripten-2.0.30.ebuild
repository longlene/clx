# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{8,9} )
inherit cmake python-any-r1

MY_PV=1.40.1

DESCRIPTION="LLVM-to-JavaScript Compiler"
HOMEPAGE="http://emscripten.org/"
SRC_URI="
	https://github.com/emscripten-core/emscripten/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/emscripten-core/emscripten-fastcomp/archive/${MY_PV}.tar.gz -> ${PN}-fastcomp-${MY_PV}.tar.gz
	https://github.com/emscripten-core/emscripten-fastcomp-clang/archive/${MY_PV}.tar.gz -> ${PN}-fastcomp-clang-${MY_PV}.tar.gz
"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	net-libs/nodejs
"

CMAKE_USE_DIR="${WORKDIR}"/emscripten-fastcomp-${PV}
CMAKE_BUILD_TYPE=Release

src_prepare() {
	default
	ln -s "${WORKDIR}"/emscripten-fastcomp-clang-${MY_PV} "${WORKDIR}"/emscripten-fastcomp-${MY_PV}/tools/clang
	sed -e "s|#include \"../../../../emscripten-version.txt\"|\"${PV}\"|" \
		-e "s|#include \"../../../../tools/clang/emscripten-version.txt\"|\"${PV}\"|" \
		-i ${WORKDIR}/emscripten-fastcomp-${MY_PV}/tools/clang/lib/Basic/Version.cpp || die

	sed -e "s|getenv('LLVM'|getenv('EMSCRIPTEN_FASTCOMP'|" \
		-e "s|{{{ LLVM_ROOT }}}|/usr/$(get_libdir)/emscripten-fastcomp|" \
		-i tools/settings_template_readonly.py
}

src_configure() {
	local mycmakeargs=(
	-DCMAKE_SKIP_RPATH=YES
	-DLLVM_TARGETS_TO_BUILD="X86;JSBackend"
	-DLLVM_BUILD_RUNTIME=OFF
	-DLLVM_INCLUDE_EXAMPELS=OFF
	-DLLVM_INCLUDE_TESTS=OFF
	-DCLANG_INCLUDE_TESTS=OFF
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/$(get_libdir)/${PN}
	doins -r em++ em++.py em-config emar emar.py embuilder.py emcc emcc.py emcmake emcmake.py emconfigure emconfigure.py emlink.py emmake emmake.py emranlib emrun emrun.py emscons emscripten-version.txt emscripten.py cmake site src system third_party tools

	for x in em++ em-config emar emcc emcc.py emconfigure emmake emranlib emscons emscripten.py ; do
		dosym /usr/$(get_libdir)/${PN}/${x} /usr/bin/${x}
	done

	insinto /usr/share/${PN}
	doins system

	insinto /usr/$(get_libdir)/${PN}-fastcomp
	doins ${CMAKE_BUILD_DIR}/bin/{FileCheck,bugpoint,clang,clang++,clang-5.0,clang-check,clang-cl,clang-cpp,clang-format,clang-offload-bundler,clang-tblgen,count,diagtool,llc,lli,lli-child-target,llvm-PerfectShuffle,llvm-ar,llvm-as,llvm-bcanalyzer,llvm-cat,llvm-config,llvm-cov,llvm-cvtres,llvm-cxxdump,llvm-cxxfilt,llvm-diff,llvm-dis,llvm-dsymutil,llvm-dwarfdump,llvm-dwp,llvm-extract,llvm-go,llvm-lib,llvm-link,llvm-lto,llvm-lto2,llvm-mc,llvm-mcmarkup,llvm-modextract,llvm-nm,llvm-objdump,llvm-opt-report,llvm-pdbutil,llvm-profdata,llvm-ranlib,llvm-readobj,llvm-rtdyld,llvm-size,llvm-split,llvm-stress,llvm-strings,llvm-symbolizer,llvm-tblgen,llvm-xray,not,obj2yaml,opt,sancov,sanstats,scan-build,scan-view,verify-uselistorder,yaml-bench,yaml2obj}

	insinto /usr/share/cmake/Modules/Platform
	doins cmake/Modules/Platform/Emscripten.cmake

	cat > ${T}/99${PN} <<EOF
EMSCRIPTEN="/usr/$(get_libdir)/${PN}"
EMSCRIPTEN_FASTCOMP="/usr/$(get_libdir)/${PN}-fastcomp"
EOF
	doenv.d ${T}/99${PN}
}

# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_10 )
inherit llvm python-any-r1 vcs-snapshot

DESCRIPTION="The Swift programming language and debugger"
HOMEPAGE="http://swift.org/"
SRC_URI="
	https://github.com/apple/swift/archive/refs/tags/${P}-RELEASE.tar.gz -> ${P}.tar.gz
	https://github.com/apple/swift-cmark/archive/refs/tags/swift-${PV}-RELEASE.tar.gz -> swift-cmark-${PV}.tar.gz
	https://github.com/apple/swift-llbuild/archive/refs/tags/swift-${PV}-RELEASE.tar.gz -> swift-llbuild-${PV}.tar.gz
	https://github.com/apple/swift-package-manager/archive/refs/tags/swift-${PV}-RELEASE.tar.gz -> swift-package-manager-${PV}.tar.gz
	https://github.com/apple/swift-corelibs-xctest/archive/refs/tags/swift-${PV}-RELEASE.tar.gz -> swift-corelibs-xctest-${PV}.tar.gz
	https://github.com/apple/swift-corelibs-foundation/archive/refs/tags/swift-${PV}-RELEASE.tar.gz -> swift-corelibs-foundation-${PV}.tar.gz
	https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-${PV}-RELEASE.tar.gz -> swift-corelibs-libdispatch-${PV}.tar.gz
	https://github.com/apple/swift-integration-tests/archive/refs/tags/swift-${PV}-RELEASE.tar.gz -> swift-integration-tests-${PV}.tar.gz
	https://github.com/apple/llvm-project/archive/refs/tags/swift-${PV}-RELEASE.tar.gz -> llvm-project-${PV}.tar.gz
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-devel/binutils[gold]
	dev-libs/libbsd
	dev-libs/libedit
	dev-libs/libxml2
	sys-devel/clang
"
RDEPEND="${DEPEND}"
BDEPEND=""

#pkg_setup() {
#	llvm_pkg_setup
#}

src_prepare() {
	default
	ln -sv swift-${PV} "${WORKDIR}"/swift
	ln -sv llvm-project-${PV} "${WORKDIR}"/llvm-project
	ln -sv swift-corelibs-libdispatch-${PV} "${WORKDIR}"/swift-corelibs-libdispatch
	ln -sv swift-corelibs-foundation-${PV} "${WORKDIR}"/swift-corelibs-foundation
	ln -sv swift-corelibs-xctest-${PV} "${WORKDIR}"/swift-corelibs-xctest
	ln -sv swift-llbuild-${PV} "${WORKDIR}"/llbuild
	ln -sv swift-cmark-${PV} "${WORKDIR}"/cmark
	ln -sv swift-package-manager-${PV} "${WORKDIR}"/swiftpm
	sed -e '/Werror/d' \
		-i "${WORKDIR}"/swift-corelibs-libdispatch-${PV}/cmake/modules/DispatchCompilerWarnings.cmake
	sed -e "/DESTINATION/{s#share/swift#share/doc/${P}#}" \
		-i CMakeLists.txt
	sed -e "s#share/doc/swift#share/doc/${P}#" \
		-i userdocs/CMakeLists.txt
}

src_compile() {
	local libdir=$(get_libdir)
	local swift_options="-DLLVM_LIBDIR_SUFFIX=${libdir#lib} -DSWIFT_INCLUDE_TEST_BINARIES=OFF"
	./utils/build-script \
		${MAKEOPTS} \
		--install-destdir="${D}" \
		--install-prefix="/usr" \
		--swift-cmake-options="${swift_options}" \
		--foundation \
		--skip-build-benchmarks \
		--skip-build-libicu \
		--skip-build-compiler-rt \
		--skip-build-clang-tools-extra \
		--skip-build-lld \
		--build-swift-examples="0" \
		--llvm-include-tests="0" \
		--swift-include-tests="0" \
		--skip-test-foundation \
		--skip-test-libcxx \
		--skip-test-libdispatch \
		--skip-test-libicu \
		--skip-test-llbuild \
		--skip-test-lldb \
		--skip-test-llvm \
		--skip-test-sourcekit \
		--skip-test-static-foundation \
		--skip-test-static-libdispatch \
		--skip-test-xctest \
		--skip-test-swift \
		|| die "compile failed"
}

src_install() {
	./utils/build-script \
		${MAKEOPTS} \
		--install-destdir="${D}" \
		--install-prefix="/usr" \
		--install-swift || die "install failed"

	#dosym swift /usr/bin/swiftc
	#dosym swift /usr/bin/swift-autolink-extract
}

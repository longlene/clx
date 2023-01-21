# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
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
	sys-libs/blocksruntime
	dev-libs/libbsd
	dev-libs/libedit
	dev-libs/libxml2
	sys-devel/clang
"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_setup() {
	llvm_pkg_setup
}

src_prepare() {
	default
	ln -sv swift-${PV} swift
	ln -sv llvm-project-${PV} llvm-project
	ln -sv swift-corelibs-libdispatch-${PV} swift-corelibs-libdispatch
	ln -sv swift-corelibs-foundation-${PV} swift-corelibs-foundation
	ln -sv swift-corelibs-xctest-${PV} swift-corelibs-xctest
	ln -sv swift-llbuild-${PV} llbuild
	ln -sv swift-cmark-${PV} cmark
	ln -sv swift-package-manager-${PV} swiftpm
	sed -e '/Werror/d' \
		-i swift-corelibs-libdispatch/cmake/modules/DispatchCompilerWarnings.cmake
}

swift_build_params=(
	${MAKEOPTS}
	--build-runtime-with-host-compiler
	--install-destdir="${D}"
	--install-prefix="/usr"
)

src_compile() {
	./utils/build-script \
		${swift_build_params[@]} \
		--foundation \
		--libdispatch || die "compile failed"
}

#src_configure() {
#	local mycmakeargs=(
#		-DSWIFT_SOURCE_ROOT="${WORKDIR}"
#		-DSWIFT_PATH_TO_LIBDISPATCH_SOURCE="${WORKDIR}"/swift-corelibs-libdispatch-5.6
#	)
#	cmake_src_configure
#}

src_install() {
	./utils/build-script \
		${swift_build_params[@]} \
		--install-destdir="${D}" \
		--install-llbuild \
		--install-swiftpm \
		--install-xctest \
		--install-foundation \
		--install-libdispatch || die "install failed"

	dosym swift /usr/bin/swiftc
	dosym swift /usr/bin/swift-autolink-extract
}

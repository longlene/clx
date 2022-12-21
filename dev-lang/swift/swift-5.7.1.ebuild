# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
inherit python-any-r1 vcs-snapshot

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
	dev-libs/blocksruntime
	dev-libs/libbsd
	dev-libs/libedit
	dev-libs/libxml2
	sys-devel/clang
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/swift
#CMAKE_BUILD_TYPE="Release"

src_unpack() {
	vcs-snapshot_src_unpack
	mv swift-${PV} swift
	mv llvm-project-${PV} llvm-project
	mv swift-corelibs-libdispatch-${PV} swift-corelibs-libdispatch
	mv swift-corelibs-foundation-${PV} swift-corelibs-foundation
	mv swift-corelibs-xctest-${PV} swift-corelibs-xctest
	mv swift-llbuild-${PV} llbuild
	mv swift-cmark-${PV} cmark
	mv swift-package-manager-${PV} swiftpm
}

src_compile() {
	./utils/build-script \
		--install-prefix="/usr" \
		--install-destdir="${D}" \
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

#swift_build_params=(
#	--preset=buildbot_linux,no_assertions,no_test
#)
#
#src_compile() {
#	./utils/build-script --preset=buildbot_linux,no_assertions,no_test install_destdir="${D}" || die "compile failed"
#}
#
#src_install() {
#	./utils/build-script "${swift_build_params[@]}" \
#		--install-destdir="${D}" \
#		--install-llbuild \
#		--install-swiftpm \
#		--install-xctest \
#		--install-foundation \
#		--install-libdispatch || die "install failed"
#
#	#dobin build/Ninja-ReleaseAssert/swift-linux-
#	dosym swift /usr/bin/swiftc
#	dosym swift /usr/bin/swift-autolink-extract
#}

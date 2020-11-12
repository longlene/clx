# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit python-any-r1 vcs-snapshot

DESCRIPTION="The Swift programming language and debugger"
HOMEPAGE="http://swift.org/"
SRC_URI="
	https://github.com/apple/swift/archive/swift-${PV}-RELEASE.tar.gz -> ${P}.tar.gz
	https://github.com/apple/swift-cmark/archive/swift-${PV}-RELEASE.tar.gz -> swift-cmark-${PV}.tar.gz
	https://github.com/apple/swift-llbuild/archive/swift-${PV}-RELEASE.tar.gz -> swift-llbuild-${PV}.tar.gz
	https://github.com/apple/swift-package-manager/archive/swift-${PV}-RELEASE.tar.gz -> swift-package-manager-${PV}.tar.gz
	https://github.com/apple/swift-corelibs-xctest/archive/swift-${PV}-RELEASE.tar.gz -> swift-corelibs-xctest-${PV}.tar.gz
	https://github.com/apple/swift-corelibs-foundation/archive/swift-${PV}-RELEASE.tar.gz -> swift-corelibs-foundation-${PV}.tar.gz
	https://github.com/apple/swift-corelibs-libdispatch/archive/swift-${PV}-RELEASE.tar.gz -> swift-corelibs-libdispatch-${PV}.tar.gz
	https://github.com/apple/swift-integration-tests/archive/swift-${PV}-RELEASE.tar.gz -> swift-integration-tests-${PV}.tar.gz
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
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/swift

PATCHES=( "${FILESDIR}"/glibc-includes.patch )

src_unpack() {
	vcs-snapshot_src_unpack
	for sdir in libcxx lldb cmark llbuild ; do
        mv swift-${sdir}-${PV} ${sdir}
    done
	for sdir in corelibs-xctest corelibs-foundation corelibs-libdispatch integration-tests ; do
        mv swift-${sdir}-${PV} swift-${sdir}
    done

	mv swift-${PV} swift
	mv swift-package-manager-${PV} swiftpm
}

swift_build_params=(
	--install-prefix=/usr
	--lldb
	--llbuild
	--swiftpm
	--xctest
	--foundation
	--libdispatch
)

src_compile() {
	export SWIFT_SOURCE_ROOT="${S}"
	./utils/build-script -R "${swift_build_params[@]}" || die "compile failed"
}

src_install() {
	./utils/build-script -R "${swift_build_params[@]}" \
		--install-destdir="${D}" \
		--install-llbuild \
		--install-swiftpm \
		--install-xctest \
		--install-foundation \
		--install-libdispatch || die "install failed"

	#dobin build/Ninja-ReleaseAssert/swift-linux-
	dosym swift /usr/bin/swiftc
	dosym swift /usr/bin/swift-autolink-extract
}

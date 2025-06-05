# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KERNEL_VERSION="linux-6.12.20"

DESCRIPTION="A library bundling a Linux kernel in a dynamic library"
HOMEPAGE="https://github.com/containers/libkrunfw/"
SRC_URI="
	https://github.com/containers/libkrunfw/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://cdn.kernel.org/pub/linux/kernel/v6.x/${KERNEL_VERSION}.tar.xz
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/pyelftools
"

PATCHES=(
	"${FILESDIR}"/dist-fix.patch
)

src_unpack() {
	unpack ${P}.tar.gz
}

src_compile() {
	local arch
	if use amd64 ; then
		arch=x86
	elif use arm64 ; then
		arch=arm64
	fi
	emake ARCH="${arch}" KERNEL_TARBALL="${DISTDIR}"/${KERNEL_VERSION}.tar.xz
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}

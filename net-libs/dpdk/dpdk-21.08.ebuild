# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs flag-o-matic linux-info linux-mod meson

DESCRIPTION="A set of libraries and drivers for fast packet processing"
HOMEPAGE="http://dpdk.org/"
SRC_URI="https://fast.${PN}.org/rel/${P}.tar.xz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl static-libs"

DEPEND="
	sys-process/numactl
	dev-python/pyelftools
	ssl? ( dev-libs/openssl:* )
"
RDEPEND="${DEPEND}"
DEPEND="
	${DEPEND}
	!net-libs/dpdk:stable
	dev-lang/nasm
"

function ctarget() {
	CTARGET="${ARCH}"
	use amd64 && CTARGET='x86_64'
	echo $CTARGET
}

CONFIG_CHECK="~IOMMU_SUPPORT ~AMD_IOMMU ~VFIO ~VFIO_PCI ~UIO ~UIO_PDRV_GENIRQ ~UIO_DMEM_GENIRQ"
if [ "$SLOT" != "0" ] ; then
	S=${WORKDIR}/${PN}-${SLOT#0/}-${PV}
fi

pkg_setup() {
	linux-mod_pkg_setup
}

src_configure() {
	local emesonargs=(
		-Dtests=false
	)
	meson_src_configure
}


# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs flag-o-matic linux-info linux-mod

DESCRIPTION="A set of libraries and drivers for fast packet processing"
HOMEPAGE="http://dpdk.org/"
SRC_URI="http://fast.${PN}.org/rel/${P}.tar.xz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl static-libs"

DEPEND="
	sys-process/numactl
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
	ARCH=$(ctarget) emake config \
		T=$(ctarget)-native-linuxapp-$(tc-get-compiler-type)
}

src_compile() {
	cd "${S}/build" || die
	ARCH=$(ctarget) V=1 emake \
		RTE_DEVEL_BUILD=n \
		CONFIG_RTE_BUILD_SHARED_LIB=y \
		CONFIG_RTE_LIBRTE_PMD_OPENSSL=$(use ssl && echo 'y' || echo 'n') \
		EXTRA_CFLAGS="${CFLAGS}"
	use static-libs && ARCH=$(ctarget) V=1 emake \
		RTE_DEVEL_BUILD=n \
		CONFIG_RTE_BUILD_SHARED_LIB=n \
		CONFIG_RTE_LIBRTE_PMD_OPENSSL=$(use ssl && echo 'y' || echo 'n') \
		EXTRA_CFLAGS="${CFLAGS}"
}

src_install() {
	pushd "${S}/build" > /dev/null || die
	sed -i -e 's/^ifdef\ T/ifdef\ TMPL/' ../mk/rte.sdkinstall.mk
	ARCH=$(ctarget) V=1 emake install \
			DESTDIR=${D} \
			libdir="${EPREFIX}/usr/$(get_libdir)" \
			prefix="${EPREFIX}/usr"
	popd > /dev/null
}

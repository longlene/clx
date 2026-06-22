# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Lightweight LLM inference framework with x86/NEON tensor backends"
HOMEPAGE="https://github.com/OpenBMB/ArcLight"
SRC_URI="https://github.com/OpenBMB/ArcLight/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/ArcLight-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="numa"

DEPEND="numa? ( sys-process/numactl )"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-fix-nnml-openmp-target.patch" )

src_configure() {
	local mycmakeargs=(
		-DARCLIGHT_BACKEND=X86
		-DNNML_USE_NUMA=$(usex numa)
		-DNNML_USE_OPENMP=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}"/al-{gen,chat,ppl}
	dolib.so "${BUILD_DIR}/libal.so"
	dolib.so "${BUILD_DIR}/nnml/libnnml.so"
	insinto /usr/include/arclight
	doins -r include/.
	insinto /usr/include/nnml
	doins -r nnml/include/.
	dodoc README.md
}

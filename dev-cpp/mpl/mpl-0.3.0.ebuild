# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A message passing library"
HOMEPAGE="https://github.com/rabauke/mpl"
SRC_URI="https://github.com/rabauke/mpl/archive/refs/tags/v${PV}.tar.gz  -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	|| (
	>=sys-cluster/openmpi-4.1.2[${MULTILIB_USEDEP},cxx?,fortran?,romio?,threads(+)?]
	>=sys-cluster/mpich-3.4.3[${MULTILIB_USEDEP},cxx?,fortran?,romio?,threads?]
	sys-cluster/native-mpi
	nullmpi? ( sys-cluster/nullmpi[${MULTILIB_USEDEP},cxx(-)?,fortran(-)?,romio(-)?,threads(-)?] )
)
"
BDEPEND=""

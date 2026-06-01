# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

HOMEPAGE="https://github.com/nvidia/gdrcopy"
SRC_URI="https://github.com/NVIDIA/gdrcopy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_compile() {
	emake CUDA=/opt/cuda
}

# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="Intel Optimization for Chainer"
HOMEPAGE="https://github.com/intel/ideep"
SRC_URI="https://github.com/intel/ideep/archive/refs/tags/pytorch-rls-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/ideep{,.hpp}
	einstalldocs
}

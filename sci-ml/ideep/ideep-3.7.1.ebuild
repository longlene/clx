# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Intel® Optimization for Chainer"
HOMEPAGE="https://github.com/intel/ideep"
SRC_URI="https://github.com/intel/ideep/archive/refs/tags/pytorch-rls-v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"/ideep-pytorch-rls-v${PV}

src_install() {
	doheader -r include/*
	einstalldocs
}

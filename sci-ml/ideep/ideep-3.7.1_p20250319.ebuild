# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="bd0681de27d3b3ea104e526a8c4d273537eed592"

DESCRIPTION="Intel® Optimization for Chainer"
HOMEPAGE="https://github.com/intel/ideep"
SRC_URI="https://github.com/intel/ideep/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	=sci-ml/oneDNN-$(ver_cut 1-3 ${PV})
"

S="${WORKDIR}"/ideep-${EGIT_COMMIT}

#PATCHES=(
#	"${FILESDIR}"/install-fix.patch
#)

src_install() {
	doheader -r include/*
	einstalldocs
}

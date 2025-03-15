# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="28f840c4477bb5053cb3a0a78df054bec400222f"

DESCRIPTION="Intel® Optimization for Chainer"
HOMEPAGE="https://github.com/intel/ideep"
SRC_URI="https://github.com/intel/${PN}/archive/${EGIT_COMMIT}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"/ideep-${EGIT_COMMIT}

#PATCHES=(
#	"${FILESDIR}"/assert-fix.patch
#)

src_install() {
	doheader -r include/*
}

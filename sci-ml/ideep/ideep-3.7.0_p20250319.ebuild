# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="bd0681de27d3b3ea104e526a8c4d273537eed592"

DESCRIPTION="Intel® Optimization for Chainer"
HOMEPAGE="https://github.com/intel/ideep"
SRC_URI="https://github.com/intel/ideep/archive/${EGIT_COMMIT}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

#PATCHES=(
#	"${FILESDIR}"/assert-fix.patch
#)

src_install() {
	doheader -r include/*
}

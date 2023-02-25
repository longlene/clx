# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="760623585b01023bbbf2a81fd7ce3bfd0bfea8e1"

DESCRIPTION="A high performance layer 4 load balancer"
HOMEPAGE="https://github.com/facebookincubator/katran"
SRC_URI="https://github.com/facebookincubator/katran/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libfmt
	dev-cpp/folly
	dev-cpp/glog
	dev-cpp/gflags
"
RDEPEND="${DEPEND}"
BDEPEND=""

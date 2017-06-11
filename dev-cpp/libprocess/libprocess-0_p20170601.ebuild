# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools vcs-snapshot

EGIT_COMMIT="0a92f18e849cdff867efc836e296b205fc593e0e"

DESCRIPTION="Library that provides an actor style message-passing programming model"
HOMEPAGE="https://github.com/3rdparty/libprocess"
SRC_URI="https://github.com/longlene/libprocess/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

DEPEND="
	dev-cpp/stout
	dev-cpp/glog
	dev-libs/libev
	ssl? ( dev-libs/openssl dev-libs/libev )
"
RDEPEND="${DEPEND}"


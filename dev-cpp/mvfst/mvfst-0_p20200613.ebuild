# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="3af87c825ecfa79ee010829272dd96ec9e7a98b4"

DESCRIPTION="An implementation of the QUIC transport protocol"
HOMEPAGE="https://github.com/facebookincubator/mvfst"
SRC_URI="https://github.com/facebookincubator/mvfst/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/fizz
	dev-cpp/folly
"
RDEPEND="${DEPEND}"
BDEPEND=""

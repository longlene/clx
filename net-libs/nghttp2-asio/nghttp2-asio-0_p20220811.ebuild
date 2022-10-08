# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="e877868abe06a83ed0a6ac6e245c07f6f20866b5"

DESCRIPTION="High level HTTP/2 C++ library"
HOMEPAGE="https://github.com/nghttp2/nghttp2-asio"
SRC_URI="https://github.com/nghttp2/nghttp2-asio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	net-libs/nghttp2
"
RDEPEND="${DEPEND}"
BDEPEND=""

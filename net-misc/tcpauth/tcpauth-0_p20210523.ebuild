# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools vcs-snapshot

EGIT_COMMIT="2b6cb7764e92b144c43d25d8cef4e0f04d8e02c9"

DESCRIPTION="wrap TCP connections in RFC2385 MD5 signatures"
HOMEPAGE="https://github.com/google/tcpauth"
SRC_URI="https://github.com/google/tcpauth/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

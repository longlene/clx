# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vcs-snapshot

EGIT_COMMIT="5c267e73152a62161497f21742b5a6b46a41d4b"

DESCRIPTION="Generic Low Overhead Message Exchange"
HOMEPAGE="https://github.com/google/glome"
SRC_URI="https://github.com/google/glome/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"
BDEPEND=""

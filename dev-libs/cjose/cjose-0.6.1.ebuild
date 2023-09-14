# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C library implementing the Javascript Object Signing and Encryption"
HOMEPAGE="https://github.com/cisco/cjose"
SRC_URI="https://github.com/cisco/cjose/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/jansson
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

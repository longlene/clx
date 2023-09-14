# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="ACMEv2 client written in plain C code with minimal dependencies"
HOMEPAGE="https://github.com/ndilieto/uacme/"
SRC_URI="https://github.com/ndilieto/uacme/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/openssl
	net-misc/curl
"
BDEPEND=""

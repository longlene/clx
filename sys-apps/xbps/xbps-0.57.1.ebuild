# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The X Binary Package System"
HOMEPAGE="https://voidlinux.org/xbps/"
SRC_URI="https://github.com/void-linux/xbps/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-libs/zlib
	dev-libs/openssl
"
BDEPEND=""

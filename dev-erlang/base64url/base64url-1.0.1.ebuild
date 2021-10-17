# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="URL safe base64-compatible codec"
HOMEPAGE="https://github.com/dvv/base64url"
SRC_URI="https://github.com/dvv/base64url/archive/1.0.1.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

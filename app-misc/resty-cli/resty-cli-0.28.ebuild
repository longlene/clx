# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fancy command-line utilities for OpenResty"
HOMEPAGE="https://github.com/openresty/resty-cli"
SRC_URI="https://github.com/openresty/resty-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	www-servers/nginx[nginx_modules_http_lua]
"
BDEPEND=""

DOCS=( README.md )

src_install() {
	dobin bin/resty
	einstalldocs
}

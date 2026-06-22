# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="6199d01510802adf22754215a7960f1989ee73a0"

inherit rebar3

DESCRIPTION="S3-compatible object storage client built on the livery client"
HOMEPAGE="https://github.com/benoitc/livery_s3"
SRC_URI="https://github.com/benoitc/livery_s3/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/livery_s3-${MY_COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-erlang/hackney-4.2.1
	>=dev-erlang/livery-0.1.0
"

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}

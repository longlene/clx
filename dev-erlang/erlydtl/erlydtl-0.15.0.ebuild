# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Django templates for Erlang"
HOMEPAGE="https://github.com/erlydtl/erlydtl"
SRC_URI="https://github.com/erlydtl/erlydtl/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/vsn, git/{s#git#\"${PV}\"#}" src/${PN}.app.src
	sed -i "/vsn, git/{s#git#\"${PV}\"#}" src/${PN}.app.src.script
}

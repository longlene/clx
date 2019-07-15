# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="6486b1eea481965f1324e45bf31a04de453205d9"

DESCRIPTION="Django templates for Erlang"
HOMEPAGE="https://github.com/erlydtl/erlydtl"
SRC_URI="https://github.com/erlydtl/erlydtl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"


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

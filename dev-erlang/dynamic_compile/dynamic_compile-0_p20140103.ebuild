# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="d13d29c03d321e154adffb8eaa4b88b154a811fd"

DESCRIPTION="compile and load erlang modules from string input"
HOMEPAGE="https://github.com/jkvor/dynamic_compile"
SRC_URI="https://github.com/jkvor/dynamic_compile/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/$(get_libdir)/erlang/lib/${P}
	doins -r ebin
}

# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="A Gradual Type System for Erlang"
HOMEPAGE="https://github.com/josefs/Gradualizer"
SRC_URI="https://github.com/josefs/Gradualizer/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/erlang"

src_install() {
	dobin bin/gradualizer
	einstalldocs
}

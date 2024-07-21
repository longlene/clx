# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="92aa0ecd30f1c1c8175d72042c319268568434fb"

DESCRIPTION="The most minimal cross-platform GUI library"
HOMEPAGE="https://github.com/zserge/fenster"
SRC_URI="https://github.com/zserge/fenster/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins fenster*.h
	einstalldocs
}

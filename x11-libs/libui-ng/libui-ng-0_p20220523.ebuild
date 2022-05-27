# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vcs-snapshot

EGIT_COMMIT="a2889acfd94dd48533cfe20234164b3d5e0d3f4c"

DESCRIPTION="A portable GUI library for C"
HOMEPAGE="https://github.com/libui-ng/libui-ng"
SRC_URI="https://github.com/libui-ng/libui-ng/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/gtk+:3
"
RDEPEND="${DEPEND}"
BDEPEND=""

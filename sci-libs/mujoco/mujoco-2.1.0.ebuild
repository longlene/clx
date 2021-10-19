# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV=${PV//./}

DESCRIPTION="Advanced physics simulation"
HOMEPAGE="https://mujoco.org/"
SRC_URI="https://mujoco.org/download/mujoco${MY_PV}-linux-x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}${MY_PV}

src_install() {
	insinto /usr/include
	doins include{mjmodel,mjui,mjxmacro,mjdata,mjrender,mjvisualize,mujoco}.h
	dolib.so bin/libmujoco210.so bin/libmujoco210nogl.so
	doins -r model sample
}

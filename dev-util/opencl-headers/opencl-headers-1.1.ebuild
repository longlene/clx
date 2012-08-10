# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="OpenCL headers from Khronos.org, tracked on github."
HOMEPAGE="https://github.com/nbigaouette/opencl-headers"
EGIT_REPO_URI="git://github.com/nbigaouette/${PN}.git
             https://github.com/nbigaouette/${PN}.git"
EGIT_BRANCH="OpenCL${PV}"

inherit git-2
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND} !dev-util/nvidia-cuda-toolkit"

RESTRICT="mirror"

src_install() {
    insinto /usr/include/CL
    for f in src/*; do
        doins $f
    done
}

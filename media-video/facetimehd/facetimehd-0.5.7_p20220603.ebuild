# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod vcs-snapshot

EGIT_COMMIT="75a2a5800aa46cbd679847b4d0863a5e3cef3b9e"

DESCRIPTION="Reverse engineered Linux driver for the FacetimeHD"
HOMEPAGE="https://github.com/patjak/facetimehd"
SRC_URI="https://github.com/patjak/facetimehd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-firmware/facetimehd-firmware"
RDEPEND="${DEPEND}"
BDEPEND=""

BUILD_TARGETS="all"
MODULE_NAMES="facetimehd()"
CONFIG_CHECK="VIDEO_V4L2_SUBDEV_API VIDEOBUF2_CORE VIDEOBUF2_DMA_SG"


# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info linux-mod vcs-snapshot

EGIT_COMMIT="75a2a5800aa46cbd679847b4d0863a5e3cef3b9e"

DESCRIPTION="Reverse engineered Linux driver for the FacetimeHD"
HOMEPAGE="https://github.com/patjak/facetimehd"
SRC_URI="https://github.com/patjak/facetimehd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	virtual/linux-sources
	sys-firmware/facetimehd-firmware
"
RDEPEND="${DEPEND}"
BDEPEND=""

BUILD_TARGETS="all"
MODULE_NAMES="facetimehd()"

pkg_setup() {
	CONFIG_CHECK="VIDEOBUF2_CORE VIDEOBUF2_DMA_SG"
	if kernel_is ge 5 18 ; then
		CONFIG_CHECK="${CONFIG_CHECK} VIDEO_DEV"
	else
		CONFIG_CHECK="${CONFIG_CHECK} VIDEO_V4L2"
	fi
	linux-mod_pkg_setup
}


# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="OpenVINO Plugins for OBS Studio"
HOMEPAGE="https://github.com/intel/openvino-plugins-for-obs-studio"
SRC_URI="https://github.com/intel/openvino-plugins-for-obs-studio/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	media-libs/opencv
	media-video/obs-studio
	sci-ml/openvino
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/share/obs/obs-plugins
	doins -r openvino-models
	insinto /usr/$(get_libdir)/obs-plugins
	doins ${BUILD_DIR}/obs_plugins/*/*.so
	einstalldocs
}

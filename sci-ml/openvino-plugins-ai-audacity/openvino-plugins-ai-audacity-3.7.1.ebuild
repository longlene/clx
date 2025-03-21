# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A set of AI-enabled effects, generators, and analyzers for Audacity"
HOMEPAGE="https://github.com/intel/openvino-plugins-ai-audacity/"
SRC_URI="https://github.com/intel/openvino-plugins-ai-audacity/archive/refs/tags/v${PV}-R4.2.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
#KEYWORDS="~amd64"

DEPEND="
	media-sound/audacity
	sci-libs/openvino
	sci-libs/pytorch
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${P}-R4.2/mod-openvino

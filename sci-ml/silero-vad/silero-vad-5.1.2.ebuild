# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Voice Activity Detector (VAD) by Silero"
HOMEPAGE="
	https://github.com/snakers4/silero-vad
"
SRC_URI="https://github.com/snakers4/silero-vad/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-1.12.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchaudio-0.12.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/onnxruntime-1.16.1[python]
"

RESTRICT="test" # Need some modules, not yet packaged

distutils_enable_tests pytest

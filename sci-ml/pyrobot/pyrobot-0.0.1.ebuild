# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="An Open Source Robotics Research Platform"
HOMEPAGE="https://pyrobot.org/"
SRC_URI="https://github.com/facebookresearch/pyrobot/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/numpy-1.17.0
	>=dev-python/pyyaml-3.11
	>=dev-python/scipy-1.2.0
	>=dev-python/matplotlib-2.2.2
	>=dev-python/pillow-5.1.0
	media-libs/opencv[python]
	>=dev-python/open3d-0.5.0.0
	>=dev-python/scikit-learn-0.20.3
	>=dev-python/absl-py-0.7.1
	>=dev-python/yacs-0.1.6
	dev-python/pyassimp
	>=dev-python/pytz-2015.7
	>=dev-python/bezier-0.10.0
"
BDEPEND=""

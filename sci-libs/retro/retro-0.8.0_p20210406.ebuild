# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="98fe0d328e1568836a46e5fce55a607f47a0c332"

DESCRIPTION="Retro Games in Gym"
HOMEPAGE="https://github.com/openai/retro"
SRC_URI="https://github.com/openai/retro/archive//${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/gym
	>=dev-python/pyglet-1.3.2
"
BDEPEND=""

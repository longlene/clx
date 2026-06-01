# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Tools for developing and building libraries modeled on BDE"
HOMEPAGE="https://github.com/bloomberg/bde-tools"
SRC_URI="https://github.com/bloomberg/bde-tools/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

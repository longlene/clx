# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="7a2d471922c38c79871c4499a26b60b6cb192250"

DESCRIPTION="TODO"
HOMEPAGE="https://github.com/licjon/cl-llama-cpp"
SRC_URI="https://github.com/licjon/cl-llama-cpp/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-${MY_COMMIT}"

LICENSE="TODO"
SLOT="0"
KEYWORDS="~amd64"

# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="3943e5038c582083d87f79c5616ed82b149cf920"

DESCRIPTION="Additions to the Erlang maps module"
HOMEPAGE="https://github.com/eproxus/mapz"
SRC_URI="https://github.com/eproxus/mapz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

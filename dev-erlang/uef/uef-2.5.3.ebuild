# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

DESCRIPTION="Useful Erlang Functions Library"
HOMEPAGE="https://github.com/DOBRO/uef-lib"
SRC_URI="https://github.com/DOBRO/uef-lib/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

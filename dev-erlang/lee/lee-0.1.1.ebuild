# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

DESCRIPTION="Type-safe, declarative configuration management system for Erlang"
HOMEPAGE="https://github.com/k32/Lee"
SRC_URI="https://github.com/k32/Lee/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/map_sets
	dev-erlang/typerefl
"
RDEPEND="${DEPEND}"
BDEPEND=""

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Fairness regulator and rate limiter"
HOMEPAGE="https://github.com/g-andrade/aequitas"
SRC_URI="https://github.com/g-andrade/aequitas/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

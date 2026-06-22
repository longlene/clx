# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="B-trees of order 5 (tree, set, multiset) for Erlang/OTP"
HOMEPAGE="https://github.com/g-andrade/xb5"
SRC_URI="https://github.com/g-andrade/xb5/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

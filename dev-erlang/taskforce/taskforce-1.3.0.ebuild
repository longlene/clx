# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="On-demand worker pools for parallelizable tasks"
HOMEPAGE="https://github.com/g-andrade/taskforce"
SRC_URI="https://github.com/g-andrade/taskforce/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

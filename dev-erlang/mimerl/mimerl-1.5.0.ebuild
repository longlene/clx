# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Library to handle mimetypes"
HOMEPAGE="https://github.com/benoitc/mimerl"
SRC_URI="https://github.com/benoitc/mimerl/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

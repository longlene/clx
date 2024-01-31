# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="OTP library to pragmatically and efficiently encode and decode JSON to Erlang terms"
HOMEPAGE="https://github.com/nomasystems/njson"
SRC_URI="https://github.com/nomasystems/njson/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

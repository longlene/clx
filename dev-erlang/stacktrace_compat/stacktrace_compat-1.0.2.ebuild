# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="get_stacktrace() compatibility in Erlang/OTP 21+"
HOMEPAGE="https://github.com/g-andrade/stacktrace_compat"
SRC_URI="https://github.com/g-andrade/stacktrace_compat/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

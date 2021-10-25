# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="075798518aabd73a0037007989cde8bd6923b4d9"

DESCRIPTION="High Dynamic Range HDR Histogram for Erlang/OTP, Elixir & LFE"
HOMEPAGE="https://github.com/HdrHistogram/hdr_histogram_erl"
SRC_URI="https://github.com/HdrHistogram/hdr_histogram_erl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

REBAR_APP_SRC="src/hdr_histogram.app.src"

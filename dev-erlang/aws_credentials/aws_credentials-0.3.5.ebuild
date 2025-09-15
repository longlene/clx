# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An Erlang library to provide AWS credentials"
HOMEPAGE="https://github.com/aws-beam/aws_credentials"
SRC_URI="https://github.com/aws-beam/aws_credentials/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/jsx
	dev-erlang/iso8601
	dev-erlang/eini
"
BDEPEND=""

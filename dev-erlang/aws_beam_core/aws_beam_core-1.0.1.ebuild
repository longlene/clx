# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="AWS Beam Core"
HOMEPAGE="https://github.com/aws-beam/aws_beam_core"
SRC_URI="https://github.com/aws-beam/aws_beam_core/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/aws_credentials-0.3.2
	>=dev-erlang/aws_signature-0.3.3
"
BDEPEND=""

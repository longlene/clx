# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Erlang library to format paragraphs, lists and tables as plain text"
HOMEPAGE="https://github.com/rabbitmq/stdout_formatter"
SRC_URI="https://github.com/rabbitmq/stdout_formatter/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

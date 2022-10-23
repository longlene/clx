# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="A generic Erlang SMTP server and client that can be extended via callback modules"
HOMEPAGE="https://github.com/gen-smtp/gen_smtp"
SRC_URI="https://github.com/gen-smtp/gen_smtp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/hut
	dev-erlang/ranch
"
RDEPEND="${DEPEND}"
BDEPEND=""

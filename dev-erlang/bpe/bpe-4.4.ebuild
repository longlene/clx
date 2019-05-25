# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="Business Processes Engine"
HOMEPAGE="https://github.com/synrc/bpe"
SRC_URI="https://github.com/synrc/bpe/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/bert-2.4
	>=dev-erlang/nitro-4.4
	dev-erlang/cowboy
	dev-erlang/n2o
	dev-erlang/forms
	dev-erlang/kvs
	>=dev-erlang/syn-1.5.0
"
BDEPEND=""

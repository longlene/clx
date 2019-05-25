# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="EMQ MQTT Server"
HOMEPAGE="http://emqtt.io"
SRC_URI="https://github.com/synrc/emqttd/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/gproc
	dev-erlang/kvs
	dev-erlang/lager
	dev-erlang/emqttc
	dev-erlang/mochiweb
	dev-erlang/esockd
"
BDEPEND=""

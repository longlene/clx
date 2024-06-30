# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Simple OTP app for managing Erlang VM system_monitor event messages"
HOMEPAGE="https://github.com/rabbitmq/sysmon-handler"
SRC_URI="https://github.com/rabbitmq/sysmon-handler/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 MPL-2.0"

SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

REBAR_APP_SRC=src/sysmon_handler.app.src

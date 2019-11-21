# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="The LeoFS Storage System"
HOMEPAGE="https://leo-project.net/leofs/"
SRC_URI="https://github.com/leo-project/leofs/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/leo_cache
	dev-erlang/leo_commons
	dev-erlang/leo_logger
	dev-erlang/leo_object_storage
	dev-erlang/leo_pod
	dev-erlang/leo_redundant_manager
	dev-erlang/leo_statistics
	dev-erlang/leo_s3_libs
	dev-erlang/leo_watchdog
	dev-erlang/savanna_agent
	dev-erlang/erpcgen
	dev-erlang/nfs_rpc_server
	dev-erlang/cowboy
	dev-erlang/cowlib
	dev-erlang/sd_notify
	dev-erlang/jiffy
	dev-erlang/leo_mq
	dev-erlang/leo_ordning_reda
"
BDEPEND=""

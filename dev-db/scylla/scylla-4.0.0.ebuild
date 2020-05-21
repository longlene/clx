# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ ${PV} == "9999" ]] ; then
	#EGIT_COMMIT="scylla-"
	EGIT_REPO_URI="https://github.com/scylladb/scylla.git"
	inherit git-r3
else
	MY_PV="${PV/_rc/.rc}"
	MY_P="${PN}-${MY_PV}"
	C_ARES_COMMIT="fd6124c74da0801f23f9d324559d8b66fb83f533"
	FMT_COMMIT="f61e71ccb9ab253f6d76096b2d958caf38fcccaa"
	LIBDEFLATE_COMMIT="e7e54eab42d7fd3c684cfe8278084fc354a2455a"
	SEASTAR_COMMIT="16641efb15d7832f5106f294008937923c432c34"
	SWAGGER_COMMIT="1b212bbe713905aac22af1edb836f5cf8cc39cc2"
	XXHASH_COMMIT="744892b802dcf61a78a3f2f1311d542577c16d66"
	SRC_URI="
		https://github.com/scylladb/${PN}/archive/scylla-${MY_PV}.tar.gz -> ${MY_P}.tar.gz
		https://github.com/scylladb/scylla-seastar/archive/${SEASTAR_COMMIT}.tar.gz -> seastar-${SEASTAR_COMMIT}.tar.gz
		https://github.com/scylladb/scylla-swagger-ui/archive/${SWAGGER_COMMIT}.tar.gz -> scylla-swagger-ui-${SWAGGER_COMMIT}.tar.gz
		https://github.com/scylladb/fmt/archive/${FMT_COMMIT}.tar.gz -> fmt-${FMT_COMMIT}.tar.gz
		https://github.com/scylladb/c-ares/archive/${C_ARES_COMMIT}.tar.gz -> c-ares-${C_ARES_COMMIT}.tar.gz
		https://github.com/scylladb/libdeflate/archive/${LIBDEFLATE_COMMIT}.tar.gz -> libdeflate-${LIBDEFLATE_COMMIT}.tar.gz
		https://github.com/scylladb/xxHash/archive/${XXHASH_COMMIT}.tar.gz -> xxhash-${XXHASH_COMMIT}.tar.gz
	"
	KEYWORDS="~amd64"
	S="${WORKDIR}/scylla-${MY_P}"
fi

PYTHON_COMPAT=( python3_{4,5,6} )

inherit autotools flag-o-matic linux-info python-r1 toolchain-funcs systemd user

DESCRIPTION="NoSQL data store using the seastar framework, compatible with Apache Cassandra"
HOMEPAGE="http://scylladb.com/"

LICENSE="AGPL-3"
SLOT="0"
IUSE="doc systemd"

# NOTE:
# if you want to debug using backtraces, enable the 'splitdebug' FEATURE:
# https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Backtraces
#
# then check out:
# https://github.com/scylladb/scylla/wiki/How-to-resolve-backtrace

RESTRICT="test"

RDEPEND="
	>=dev-libs/thrift-0.11.0
	<dev-util/ragel-7.0
	<sys-apps/hwloc-2.0.0
	~app-admin/scylla-jmx-${PV}
	~app-admin/scylla-tools-${PV}
	>=virtual/jdk-1.8.0:*
	app-arch/lz4
	app-arch/snappy
	dev-cpp/antlr-cpp:3.5
	dev-cpp/yaml-cpp
	dev-java/antlr:3.5
	dev-libs/boost[icu]
	dev-libs/crypto++
	dev-libs/jsoncpp
	dev-libs/libaio
	dev-libs/libxml2
	dev-libs/protobuf
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/pystache[${PYTHON_USEDEP}]
	dev-python/pyudev[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/urwid[${PYTHON_USEDEP}]
	dev-util/systemtap
	net-libs/gnutls
	net-misc/lksctp-tools
	sys-apps/ethtool
	sys-fs/xfsprogs
	sys-libs/libunwind
	sys-libs/zlib
	sys-process/numactl
	x11-libs/libpciaccess
	systemd? ( sys-apps/systemd )
"
DEPEND="${RDEPEND}
	>=sys-kernel/linux-headers-3.5
	dev-util/ninja
"

# Discussion about kernel configuration:
# https://groups.google.com/forum/#!topic/scylladb-dev/qJu2zrryv-s
CONFIG_CHECK="~NUMA_BALANCING ~SYN_COOKIES ~TRANSPARENT_HUGEPAGE"
ERROR_NUMA_BALANCING="${PN} recommends support for Memory placement aware NUMA scheduler (NUMA_BALANCING)."
ERROR_SYN_COOKIES="${PN} recommends support for TCP syncookie (SYN_COOKIES)."
ERROR_TRANSPARENT_HUGEPAGE="${PN} recommends support for Transparent Hugepage (TRANSPARENT_HUGEPAGE)."

# NOTE: maybe later depending on upstream energy, support DPDK
# For DPDK, removed HUGETLBFS PROC_PAGE_MONITOR UIO_PCI_GENERIC in favor of VFIO
# CONFIG_CHECK="~NUMA_BALANCING ~SYN_COOKIES ~TRANSPARENT_HUGEPAGE ~VFIO"
# ERROR_VFIO="${PN} running with DPDK recommends support for Non-Privileged userspace driver framework (VFIO)."

DOCS=( LICENSE.AGPL NOTICE.txt ORIGIN README.md README-DPDK.md )
PATCHES=(
	"${FILESDIR}"/0001-thrift-support-version-0.11-after-THRIFT-2221.patch
)

pkg_pretend() {
	if tc-is-gcc ; then
		if [[ $(gcc-major-version) -lt 7 && $(gcc-minor-version) -lt 3 ]] ; then
				die "You need at least sys-devel/gcc-7.3"
		fi
	fi
}

pkg_setup() {
	linux-info_pkg_setup
	enewgroup scylla
	enewuser scylla -1 -1 /var/lib/${PN} scylla
}

src_prepare() {
	default

	# replace git submodules by symlinks
	if [[ ${PV} == "9999" ]] ; then
		# set version
		local git_commit=$(git log --pretty=format:'%h' -n 1)
		echo "${PV}-${git_commit}" > version
	else
		rmdir seastar || die
		mv "${WORKDIR}/scylla-seastar-${SEASTAR_COMMIT}" seastar || die

		rmdir seastar/c-ares || die
		mv "${WORKDIR}/c-ares-${C_ARES_COMMIT}" seastar/c-ares || die

		rmdir seastar/fmt || die
		mv "${WORKDIR}/fmt-${FMT_COMMIT}" seastar/fmt || die

		rmdir swagger-ui || die
		mv "${WORKDIR}/scylla-swagger-ui-${SWAGGER_COMMIT}" swagger-ui || die

		rmdir xxHash || die
		mv "${WORKDIR}/xxHash-${XXHASH_COMMIT}" xxHash || die

		rmdir libdeflate || die
		mv "${WORKDIR}/libdeflate-${LIBDEFLATE_COMMIT}" libdeflate || die

		# set version
		echo "${MY_PV}-gentoo" > version
	fi

	# fix jsoncpp detection
	sed -e 's@json/json.h@jsoncpp/json/json.h@g' -i json.hh || die

	# QA: no -Werror (tho it does not propagate)
	sed -e 's/\-Werror//g' -i configure.py || die

	# QA NOTE: respect -O3 as it is upstream recommended
	# and because we would kill the RAM of the machine with lower optimization
	# since some files can take up to 8GB of RAM to compile!
	# sed -e 's/\-O3//g' -i configure.py || die

	# run a clean autoreconf on c-ares
	pushd seastar/c-ares
	eautoreconf || die
	popd

	# I don't agree with the old 4GB of RAM per job, it's more about 8GB now
	sed -e 's/4000000000/8000000000/g' -i scripts/jobs || die
}

src_configure() {
	python_setup

	# copied from dist/redhat/scylla.spec.mustache
	# we want a package compiled with old kernel headers to
	# support nowait aio if the user upgrades their kernel
	if ! grep -qwr RWF_NOWAIT /usr/include/linux; then
	    append-cflags "-DRWF_NOWAIT=8"
	fi
	if ! grep -qwr aio_rw_flags /usr/include/linux; then
	    append-cflags "-Daio_rw_flags=aio_reserved1"
	fi

	# native CPU CFLAGS are strongly enforced by upstreams, respect that
	replace-cpu-flags "*" "native"

	append-cflags "-Wno-attributes -Wno-array-bounds"

	${EPYTHON} configure.py --enable-gcc6-concepts --mode=release --with=scylla --disable-xen --c-compiler "$(tc-getCC)" --compiler "$(tc-getCXX)" --ldflags "${LDFLAGS}" --cflags "${CFLAGS}" --python ${EPYTHON} --with-antlr3 /usr/bin/antlr3.5 || die
}

src_compile() {
	# we use the provided 'scripts/jobs' to figure out how many parallel
	# compilation jobs we can sustain
	einfo "Compiling using $(scripts/jobs) jobs"
	ninja -v build/release/scylla build/release/iotune -j$(scripts/jobs) || die
}

src_install() {
	# NOTE:
	# I base myself on upstream's install.sh file

	default

	local MUSTACHE_DIST="\"debian\": true"
	pystache dist/common/systemd/scylla-server.service.mustache "{ $MUSTACHE_DIST }" > build/scylla-server.service
	pystache dist/common/systemd/scylla-housekeeping-daily.service.mustache "{ $MUSTACHE_DIST }" > build/scylla-housekeeping-daily.service
	pystache dist/common/systemd/scylla-housekeeping-restart.service.mustache "{ $MUSTACHE_DIST }" > build/scylla-housekeeping-restart.service

	insinto /etc/default
	doins dist/common/sysconfig/scylla-server

	insinto /etc/security/limits.d
	doins dist/common/limits.d/scylla.conf

	insinto /etc/scylla.d
	doins dist/common/scylla.d/*.conf

	insinto /etc/sysctl.d
	doins dist/common/sysctl.d/*.conf

	insinto /etc/scylla
	for config_file in scylla.yaml cassandra-rackdc.properties; do
		doins conf/${config_file}
	done

	systemd_dounit build/*.service
	systemd_dounit dist/common/systemd/*.service
	systemd_dounit dist/common/systemd/*.timer

	exeinto /usr/lib/scylla
	doexe dist/common/scripts/*
	doexe seastar/scripts/*

	dobin build/release/iotune
	dobin build/release/scylla
	dobin dist/common/bin/scyllatop

	insinto /usr/lib/scylla
	doins dist/common/scripts/scylla_blocktune.py

	exeinto /usr/lib/scylla
	doexe dist/common/scripts/scylla-blocktune
	doexe scylla-housekeeping

	insinto /etc/scylla.d
	doins conf/housekeeping.cfg

	newinitd "${FILESDIR}/scylla-server.initd" ${PN}-server
	newconfd "${FILESDIR}/scylla-server.confd" ${PN}-server

	dodoc -r licenses

	for x in /var/lib/${PN} /var/lib/${PN}/{data,commitlog,hints,coredump} /var/lib/scylla-housekeeping /var/log/scylla; do
		keepdir "${x}"
		fowners scylla:scylla "${x}"
	done

	insinto /usr/lib/scylla/swagger-ui
	doins -r swagger-ui/dist

	insinto /usr/lib/scylla/api
	doins -r api/api-doc

	insinto /usr/lib/scylla/scyllatop
	doins -r tools/scyllatop/*
	fperms +x /usr/lib/scylla/scyllatop/scyllatop.py

	insinto /var/lib/scylla-housekeeping
	doins -r scylla-housekeeping

	for util in $(ls dist/common/sbin/); do
		dosym /usr/lib/scylla/${util} /usr/sbin/${util}
	done

	insinto /etc/sudoers.d
	doins dist/debian/sudoers.d/scylla

	insinto /etc/rsyslog.d
	doins "${FILESDIR}/10-scylla.conf"

	if ! use systemd; then
		insinto /etc/cron.d
		newins dist/debian/scylla-server.cron.d scylla_delay_fstrim
	fi
}

pkg_postinst() {
	elog "You should run 'emerge --config dev-db/scylla' to finalize your ScyllaDB installation."
}

pkg_config() {
	elog "Running 'scylla_setup'..."
	scylla_setup
}
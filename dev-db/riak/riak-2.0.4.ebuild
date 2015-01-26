# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator eutils user multilib toolchain-funcs

# build time dependency
# fork of the google project with riak specific changes
# is used to build the eleveldb lib and gets removed before install
#LEVELDB_PV="${PV}"
LEVELDB_PV="2.0.0"
LEVELDB_URI="https://github.com/basho/leveldb/archive/${LEVELDB_PV}.tar.gz"
LEVELDB_P="leveldb-${LEVELDB_PV}.tar.gz"
LEVELDB_WD="${WORKDIR}/leveldb-${LEVELDB_PV}"
LEVELDB_TARGET_LOCATION="${S}/deps/eleveldb/c_src/leveldb"

DESCRIPTION="An open source, distributed database"
HOMEPAGE="http://www.basho.com/"
SRC_URI="http://s3.amazonaws.com/downloads.basho.com/${PN}/$(get_version_component_range 1-2)/${PV}/${P}.tar.gz
	${LEVELDB_URI} -> ${LEVELDB_P}
"

# prestripped files
# bootstrapped from existing dev-lang/erlang install
QA_PRESTRIPPED="
	/usr/lib.*/riak/lib/asn1-.*/priv/lib/asn1_erl_nif.so
	/usr/lib.*/riak/lib/crypto-.*/priv/lib/crypto.so
	/usr/lib.*/riak/lib/os_mon-.*/priv/bin/memsup
	/usr/lib.*/riak/lib/os_mon-.*/priv/bin/cpu_sup
	/usr/lib.*/riak/lib/runtime_tools-.*/priv/lib/dyntrace.so
	/usr/lib.*/riak/lib/runtime_tools-.*/priv/lib/trace_ip_drv.so
	/usr/lib.*/riak/lib/runtime_tools-.*/priv/lib/trace_file_drv.so
	/usr/lib.*/riak/erts-.*/bin/beam
	/usr/lib.*/riak/erts-.*/bin/beam.smp
	/usr/lib.*/riak/erts-.*/bin/child_setup
	/usr/lib.*/riak/erts-.*/bin/inet_gethost
	/usr/lib.*/riak/erts-.*/bin/heart
	/usr/lib.*/riak/erts-.*/bin/erlexec
	/usr/lib.*/riak/erts-.*/bin/erlc
	/usr/lib.*/riak/erts-.*/bin/escript
	/usr/lib.*/riak/erts-.*/bin/ct_run
	/usr/lib.*/riak/erts-.*/bin/run_erl
	/usr/lib.*/riak/erts-.*/bin/to_erl
	/usr/lib.*/riak/erts-.*/bin/epmd
"

LICENSE="Apache-2.0"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="
	dev-libs/openssl
	sys-libs/ncurses
	sys-libs/zlib
"
# TODO test non smp install
DEPEND="
<dev-lang/erlang-17.0.0
	${RDEPEND}
"

pkg_setup() {
	ebegin "Creating riak user and group"
	local riak_home="/var/$(get_libdir)/riak"
	enewgroup riak
	enewuser riak -1 -1 $riak_home riak
	eend $?
}

src_prepare() {
	# unpack source archives to patch with honor-cflags-patch
	tar xfp "${S}"/deps/erlang_js/c_src/js-*.tar.gz -C "${S}"/deps/erlang_js/c_src/ || die
	tar xfp "${S}"/deps/eleveldb/c_src/snappy-*.tar.gz -C "${S}"/deps/eleveldb/c_src/ || die

	# avoid fetching deps via git that are already available
	ln -s ${LEVELDB_WD} ${LEVELDB_TARGET_LOCATION} || die
	mkdir -p "${S}"/deps/riaknostic/deps || die
	ln -s "${S}"/deps/lager "${S}"/deps/riaknostic/deps || die
	ln -s "${S}"/deps/meck "${S}"/deps/riaknostic/deps || die
	ln -s "${S}"/deps/getopt "${S}"/deps/riaknostic/deps || die

	epatch "${FILESDIR}/${PV}-fix-directories.patch" \
		"${FILESDIR}/${PV}-honor-cflags.patch"
}

src_compile() {
	# build fails with MAKEOPTS > -j1
	emake -j1 \
		CC=$(tc-getCC) \
		CXX=$(tc-getCXX) \
		AR=$(tc-getAR) \
		LD=$(tc-getLD) \
		RANLIB=$(tc-getRANLIB) \
		STRIP="" rel
}

src_install() {
	local lib_dir=$(get_libdir)
	local erts_version=$(find /usr/${lib_dir}/erlang/lib/ -maxdepth 1 -type d -name erts-* | cut -d'-' -f2)

	# install /usr/lib
	# TODO test on x86
	insinto /usr/${lib_dir}/riak
	doins -r rel/riak/lib \
		rel/riak/releases \
		rel/riak/erts-${erts_version}
	fperms -R 0755 /usr/${lib_dir}/riak/erts-${erts_version}/bin

	cd "${D}"
	find "usr/${lib_dir}/riak/lib/" -type f -path */priv/bin/* | xargs fperms 0755
	cd "${S}"

	# install /usr/bin
	dobin rel/riak/bin/*

	# install /etc/riak
	insinto /etc/riak
	doins rel/riak/etc/*

	# restrict access to cert and key
	fperms 0600 /etc/riak/cert.pem \
		/etc/riak/key.pem

	# create neccessary directories
	keepdir /var/lib/riak/{bitcask,ring,leveldb} \
		/var/log/riak/sasl

	# change owner to riak
	fowners -R riak:riak /var/lib/riak \
		/var/log/riak

	# create docs
	doman doc/man/man1/*
	use doc && dodoc doc/*.txt

	# init.d file
	newinitd "${FILESDIR}/${PN}.initd" riak
	newconfd "${FILESDIR}/${PN}.confd" riak

	# TODO logrotate
}

pkg_postinst() {
	ewarn "To use kernel polling build erlang with the 'kpoll' useflag"
}

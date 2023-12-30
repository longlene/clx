# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools flag-o-matic toolchain-funcs vcs-snapshot

DESCRIPTION="A Multithreaded For of Redis"
HOMEPAGE="https://github.com/JohnSully/KeyDB"
SRC_URI="https://github.com/JohnSully/KeyDB/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+jemalloc tcmalloc luajit"

DEPEND="
	virtual/pkgconfig
	luajit? ( dev-lang/luajit:2 )
	!luajit? ( || ( dev-lang/lua:5.1 =dev-lang/lua-5.1*:0 ) )
	tcmalloc? ( dev-util/google-perftools )
	jemalloc? ( >=dev-libs/jemalloc-5.1:= )
"
RDEPEND="${DEPEND}"
BDEPEND=""

REQUIRED_USE="?? ( tcmalloc jemalloc )"

src_prepare() {
	default
	eapply \
		"${FILESDIR}"/${PN}-0.9.5-config.patch \
		"${FILESDIR}"/${PN}-0.9.5-shared.patch \
		"${FILESDIR}"/${PN}-0.9.5-sharedlua.patch \
		"${FILESDIR}"/${PN}-sentinel-0.9.5-config.patch

	cp "${S}"/deps/lua/src/{fpconv,lua_bit,lua_cjson,lua_cmsgpack,lua_struct,strbuf}.c "${S}"/src || die
	cp "${S}"/deps/lua/src/{fpconv,strbuf}.h "${S}"/src || die
	append-cflags "-DENABLE_CJSON_GLOBAL"

	local makefiles="" MKF
	for MKF in $(find -name 'Makefile' | cut -b 3-); do
		mv "${MKF}" "${MKF}.in"
		sed -e 's:$(CC):@CC@:g' \
			-e 's:$(CFLAGS):@AM_CFLAGS@:g' \
			-e 's: $(DEBUG)::g' \
			-e 's:$(OBJARCH)::g' \
			-e 's:ARCH:TARCH:g' \
			-e '/^CCOPT=/s:$: $(LDFLAGS):g' \
			-i "${MKF}.in" \
		|| die "Sed failed for ${MKF}"
		makefiles+=" ${MKF}"
	done

	cp "${FILESDIR}"/configure.ac configure.ac || die

	has_version 'dev-lang/lua:5.1' \
		&& LUAPKGCONFIG=lua5.1 \
		|| LUAPKGCONFIG=lua

	sed -e "/^AC_INIT/s|, [0-9].+, |, $PV, |" \
		-e "s:AC_CONFIG_FILES(\[Makefile\]):AC_CONFIG_FILES([${makefiles}]):g" \
		-e "/PKG_CHECK_MODULES.*\<LUA\>/s,lua5.1,${LUAPKGCONFIG},g" \
		-i configure.ac || die "Sed failed for configure.ac"
	eautoreconf
}

src_configure() {
	econf $(use_with luajit)
}

src_compile() {
	tc-export CC AR RANLIB

	local myconf=""

	if use tcmalloc ; then
		myconf="${myconf} USE_TCMALLOC=yes"
	elif use jemalloc ; then
		myconf="${myconf} JEMALLOC_SHARED=yes"
	else
		myconf="${myconf} MALLOC=yes"
	fi

	emake ${myconf} V=1 CC="${CC}" AR="${AR} rcu" RANLIB="${RANLIB}"
}

src_install() {
	insinto /etc/
	newins redis.conf keydb.conf
	newins sentinel.conf keydb-sentinel.conf
	
	newconfd "${FILESDIR}/keydb.confd" keydb
	newinitd "${FILESDIR}/keydb.initd" keydb

	newconfd "${FILESDIR}/keydb-sentinel.confd" keydb-sentinel
	newinitd "${FILESDIR}/keydb-sentinel.initd" keydb-sentinel

	insinto /etc/logrotated.d/
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

	dodoc README.md

	dobin src/keydb-cli
	dosbin src/keydb-benchmark src/keydb-server src/keydb-check-aof src/keydb-check-rdb src/keydb-sentinel

	diropts -m0750 -o keydb -g keydb
	keepdir /var/{log,lib}/keydb
}


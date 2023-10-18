# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Angie - drop-in replacement for Nginx"
HOMEPAGE="https://angie.software/en/"
SRC_URI="https://github.com/webserver-llc/angie/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

ANGIE_MODULES_STD="access api auth_basic autoindex browser charset empty_gif
	fastcgi geo grpc gzip limit_conn limit_req map memcached mirror
	proxy prometheus referer rewrite scgi split_clients ssi upstream_hash
	upstream_ip_hash upstream_keepalive upstream_least_conn upstream_random
	upstream_sticky upstream_zone userid uwsgi"
ANGIE_MODULES_OPT="addition auth_request dav degradation flv geoip gunzip
	gzip_static image_filter mp4 perl random_index realip secure_link
	slice stub_status sub xslt"
ANGIE_MODULES_STREAM_STD="access geo limit_conn map return set split_clients
	upstream_hash upstream_least_conn upstream_random upstream_zone"
ANGIE_MODULES_STREAM_OPT="geoip realip ssl_preread"
ANGIE_MODULES_MAIL="imap pop3 smtp"

IUSE="aio debug +http +http2 http3 +http-cache libatomic pcre +pcre2 pcre-jit ssl threads"

for mod in $ANGIE_MODULES_STD; do
	IUSE="${IUSE} +angie_modules_http_${mod}"
done

for mod in $ANGIE_MODULES_OPT; do
	IUSE="${IUSE} angie_modules_http_${mod}"
done

for mod in $ANGIE_MODULES_STREAM_STD; do
	IUSE="${IUSE} angie_modules_stream_${mod}"
done

for mod in $ANGIE_MODULES_STREAM_OPT; do
	IUSE="${IUSE} angie_modules_stream_${mod}"
done

for mod in $ANGIE_MODULES_MAIL; do
	IUSE="${IUSE} angie_modules_mail_${mod}"
done

CDEPEND="
	virtual/libcrypt:=
	pcre? ( dev-libs/libpcre:= )
	pcre2? ( dev-libs/libpcre2:= )
	pcre-jit? ( dev-libs/libpcre:=[jit] )
	ssl? ( dev-libs/openssl:0= )
	http2? ( >=dev-libs/openssl-1.0.1c:0= )
	http-cache? ( dev-libs/openssl )
	angie_modules_http_geoip? ( dev-libs/geoip )
	angie_modules_http_gunzip? ( sys-libs/zlib )
	angie_modules_http_gzip? ( sys-libs/zlib )
	angie_modules_http_gzip_static? ( sys-libs/zlib )
	angie_modules_http_rewrite? ( dev-libs/libpcre:= )
	angie_modules_stream_geoip? ( dev-libs/geoip )
"
DEPEND="${CDEPEND}"
RDEPEND="${DEPEND}"
BDEPEND=""

REQUIRED_USE="
	pcre-jit? ( pcre )
	angie_modules_http_grpc? ( http2 )
"

pkg_setup() {
	ANGIE_HOME="/var/lib/angie"
	ANGIE_HOME_TMP="${ANGIE_HOME}/tmp"
}

src_configure() {
	local myconf=() http_enabled= mail_enabled= stream_enabled=

	use aio       && myconf+=( --with-file-aio )
	use debug     && myconf+=( --with-debug )
	use http2     && myconf+=( --with-http_v2_module )
	use http3     && myconf+=( --with-http_v3_module )
	use libatomic && myconf+=( --with-libatomic )
	use pcre      && myconf+=( --with-pcre --without-pcre2 )
	use pcre-jit  && myconf+=( --with-pcre-jit )
	use threads   && myconf+=( --with-threads )

	for mod in $ANGIE_MODULES_STD; do
		if use angie_modules_http_${mod}; then
			http_enabled=1
		else
			myconf+=( --without-http_${mod}_module )
		fi
	done

	for mod in $ANGIE_MODULES_OPT; do
		if use angie_modules_http_${mod}; then
			http_enabled=1
			myconf+=( --with-http_${mod}_module )
		fi
	done

	if use http || use http-cache || use http2 || use http3; then
		http_enabled=1
	fi

	if [ $http_enabled ]; then
		use http-cache || myconf+=( --without-http-cache )
		use ssl && myconf+=( --with-http_ssl_module )
	else
		myconf+=( --without-http --without-http-cache )
	fi

	for mod in $ANGIE_MODULES_STREAM_STD; do
		if use angie_modules_stream_${mod}; then
			stream_enabled=1
		else
			myconf+=( --without-stream_${mod}_module )
		fi
	done

	for mod in $ANGIE_MODULES_STREAM_OPT; do
		if use angie_modules_stream_${mod}; then
			http_enabled=1
			myconf+=( --with-http_${mod}_module )
		fi
	done

	if [ $stream_enabled ]; then
		myconf+=( --with-stream )
		use ssl && myconf+=( --with-stream_ssl_module )
	fi

	for mod in $ANGIE_MODULES_MAIL; do
		if use angie_modules_mail_${mod}; then
			mail_enabled=1
		else
			myconf+=( --without-mail_${mod}_module )
		fi
	done

	if [ $mail_enabled ]; then
		myconf+=( --with-mail )
		use ssl && myconf+=( --with-mail_ssl_module )
	fi

	myconf+=( --user=${PN} )
	myconf+=( --group=${PN} )

	./configure \
		--prefix="${EPREFIX}"/usr \
		--conf-path="${EPREFIX}"/etc/${PN}/${PN}.conf \
		--error-log-path="${EPREFIX}"/var/log/${PN}/error_log \
		--pid-path="${EPREFIX}"/run/${PN}.pid \
		--lock-path="${EPREFIX}"/run/lock/${PN}.lock \
		--with-cc-opt="-I${ESYSROOT}/usr/include" \
		--with-ld-opt="-L${ESYSROOT}/usr/$(get_libdir)" \
		--http-log-path="${EPREFIX}"/var/log/${PN}/access_log \
		--http-client-body-temp-path="${EPREFIX}${ANGIE_HOME_TMP}"/client \
		--http-proxy-temp-path="${EPREFIX}${ANGIE_HOME_TMP}"/proxy \
		--http-fastcgi-temp-path="${EPREFIX}${ANGIE_HOME_TMP}"/fastcgi \
		--http-scgi-temp-path="${EPREFIX}${ANGIE_HOME_TMP}"/scgi \
		--http-uwsgi-temp-path="${EPREFIX}${ANGIE_HOME_TMP}"/uwsgi \
		--with-compat \
		"${myconf[@]}" || die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install

	cp "${FILESDIR}"/angie.conf "${ED}"/etc/angie/angie.conf || die
	newinitd "${FILESDIR}"/angie.initd angie
	newconfd "${FILESDIR}"/angie.confd angie

	doman man/angie.8
	dodoc CHANGES* README*

	keepdir /var/www/localhost
	rm -rf "${ED}"/usr/html || die

	keepdir /var/log/angie

	fperms 0710 /var/log/angie

	rm -rf "${ED}"/run || die
}

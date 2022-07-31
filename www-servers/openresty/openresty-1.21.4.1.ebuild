# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ssl-cert toolchain-funcs flag-o-matic user systemd

DESCRIPTION="High Performance Web Platform Based on Nginx and LuaJIT"
HOMEPAGE="http://openresty.org"
SRC_URI="https://openresty.org/download/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="+aio debug +http2 libatomic +pcre +pcre-jit rtmp selinux +threads"

pkg_setup() {
	OPENRESTY_HOME="/var/lib/openresty"

	ebegin "Creating openresty user and group"
	enewgroup ${PN}
	enewuser ${PN} -1 -1 "${OPENRESTY_HOME}" ${PN}
	eend $?
}

src_configure() {
	local myconf=()
	use aio && myconf+=( --with-file-aio )
	use debug && myconf+=( --with-debug )
	use http2 && myconf+=( --with-http_v2_module )
	use pcre && myconf+=( --with-pcre )
	use pcre-jit && myconf+=( --with-pcre-jit )
	use threads && myconf+=( --with-threads )

	export LANG=C LC_ALL=C
	tc-export AR CC

	if ! use prefix; then
		myconf+=( --user=${PN} )
		myconf+=( --group=${PN} )
	fi

	./configure \
		--prefix="${EPREFIX}"/usr/lib/openresty \
		--conf-path="${EPREFIX}"/etc/${PN}/${PN}.conf \
		--error-log-path="${EPREFIX}"/var/log/${PN}/error_log \
		--pid-path="${EPREFIX}"/run/${PN}.pid \
		--lock-path="${EPREFIX}"/run/lock/${PN}.lock \
		--with-cc-opt="-I${ESYSROOT}/usr/include${WITHOUT_IPV6}" \
		--with-ld-opt="-L${ESYSROOT}/usr/$(get_libdir)" \
		--http-log-path="${EPREFIX}"/var/log/${PN}/access_log \
		--http-client-body-temp-path="${EPREFIX}${NGINX_HOME_TMP}"/client \
		--http-proxy-temp-path="${EPREFIX}${NGINX_HOME_TMP}"/proxy \
		--http-fastcgi-temp-path="${EPREFIX}${NGINX_HOME_TMP}"/fastcgi \
		--http-scgi-temp-path="${EPREFIX}${NGINX_HOME_TMP}"/scgi \
		--http-uwsgi-temp-path="${EPREFIX}${NGINX_HOME_TMP}"/uwsgi \
		--with-http_stub_status_module \
		--with-http_sub_module \
		--with-http_dav_module \
		--with-http_flv_module \
		--with-http_mp4_module \
		--with-http_gunzip_module \
		--with-http_gzip_static_module \
		--with-http_realip_module \
		--with-http_addition_module \
		--with-http_auth_request_module \
		--with-http_secure_link_module \
		--with-http_random_index_module \
		--with-http_ssl_module \
		--with-luajit \
		--with-stream \
		--with-stream_ssl_module \
		--with-stream_ssl_preread_module \
		--with-http_iconv_module \
		"${myconf[@]}" || die "configure failed"
}

src_compile() {
	export LANG=C LC_ALL=C
	emake LINK="${CC} ${LDFLAGS}" OTHERLDFLAGS="${LDFLAGS}"
}

src_install() {
	emake DESTDIR="${D}" install
	dosym ../lib/openresty/bin/resty /usr/bin/resty
	dosym ../lib/openresty/bin/restydoc /usr/bin/restydoc
	dosym ../lib/openresty/bin/opm /usr/bin/opm
	dosym ../lib/openresty/nginx/sbin/nginx /usr/bin/openresty
	rm -rf "${ED}"/usr/lib/openresty/luajit/lib/libluajit-5.1.a || die
	rm -rf "${ED}"/usr/lib/openresty/luajit/share/man || die

	cp "${FILESDIR}"/openresty.conf "${ED}"/etc/openresty/openresty.conf || die

	newinitd "${FILESDIR}"/openresty.initd openresty
	newconfd "${FILESDIR}"/openresty.confd openresty

	systemd_newunit "${FILESDIR}"/openresty.service openresty.service

	dodoc README.markdown

	# just keepdir. do not copy the default htdocs files (bug #449136)
	keepdir /var/www/localhost
	rm -rf "${ED}"/usr/html || die

	keepdir /var/log/openresty

	fperms 0710 /var/log/openresty
	fowners 0:${PN} /var/log/openresty

	# logrotate
	insinto /etc/logrotate.d
	newins "${FILESDIR}"/openresty.logrotate openresty

	# Don't create /run
	rm -rf "${ED}"/run || die
}

pkg_postinst() {
	if [[ ! -f "${EROOT}"/etc/ssl/${PN}/${PN}.key ]]; then
		install_cert /etc/ssl/${PN}/${PN}
		use prefix || chown ${PN}:${PN} "${EROOT}"/etc/ssl/${PN}/${PN}.{crt,csr,key,pem}
	fi
}

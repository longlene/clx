# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_14 )

inherit python-single-r1

DESCRIPTION="Self-hosted media tracking server with ActivityPub federation"
HOMEPAGE="https://github.com/neodb-social/neodb"
SRC_URI="https://github.com/neodb-social/neodb/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	>=dev-python/blurhash-rs-1.1.0[${PYTHON_SINGLE_USEDEP}]
	app-misc/typesense
	$(python_gen_cond_dep '
		>=dev-python/cachetools-5.5.0[${PYTHON_USEDEP}]
		>=dev-python/dateparser-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/django-5.2[${PYTHON_USEDEP}]
		>=dev-python/django-anymail-13.0[${PYTHON_USEDEP}]
		>=dev-python/django-auditlog-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/django-bleach-3.1.0[${PYTHON_USEDEP}]
		dev-python/django-compressor[${PYTHON_USEDEP}]
		dev-python/django-cors-headers[${PYTHON_USEDEP}]
		>=dev-python/django-environ-0.11.2[${PYTHON_USEDEP}]
		>=dev-python/django-hijack-3.7.0[${PYTHON_USEDEP}]
		dev-python/django-jsonform[${PYTHON_USEDEP}]
		dev-python/django-maintenance-mode[${PYTHON_USEDEP}]
		>=dev-python/django-ninja-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/django-polymorphic-4.11.2[${PYTHON_USEDEP}]
		dev-python/django-redis[${PYTHON_USEDEP}]
		>=dev-python/django-rq-3.1[${PYTHON_USEDEP}]
		>=dev-python/django-sass-processor-1.4.1[${PYTHON_USEDEP}]
		>=dev-python/django-storages-1.14.5[${PYTHON_USEDEP}]
		>=dev-python/django-tz-detect-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/django-user-messages-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/dnspython-2.7.0[${PYTHON_USEDEP}]
		>=dev-python/easy-thumbnails-2.10[${PYTHON_USEDEP}]
		>=dev-python/filetype-1.2.0[${PYTHON_USEDEP}]
		>=www-servers/gunicorn-23.0.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
		>=dev-python/igdb-api-v4-0.3.3[${PYTHON_USEDEP}]
		>=dev-python/langdetect-1.0.9[${PYTHON_USEDEP}]
		>=dev-python/listparser-0.20[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.2[${PYTHON_USEDEP}]
		>=dev-python/lxml-6.1.1[${PYTHON_USEDEP}]
		>=dev-python/markdownify-0.13.1[${PYTHON_USEDEP}]
		>=dev-python/mistune-3.0.2[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.1.5[${PYTHON_USEDEP}]
		>=dev-python/podcastparser-0.6.10[${PYTHON_USEDEP}]
		>=dev-python/psycopg-3.3.4[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
		>=dev-python/sentry-sdk-2.44.0[${PYTHON_USEDEP}]
		>=dev-python/setproctitle-1.3.7[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.6[${PYTHON_USEDEP}]
		>=dev-python/urlman-2.0.2[${PYTHON_USEDEP}]
		>=dev-python/validators-0.34.0[${PYTHON_USEDEP}]
		>=dev-python/deepmerge-2.0[${PYTHON_USEDEP}]
		dev-python/django-typed-models[${PYTHON_USEDEP}]
		>=dev-python/atproto-0.0.55[${PYTHON_USEDEP}]
		>=dev-python/discord-py-2.4.0[${PYTHON_USEDEP}]
		>=dev-python/libsass-0.23.0[${PYTHON_USEDEP}]
		dev-python/certifi[${PYTHON_USEDEP}]
		>=dev-python/deepl-1.22.0[${PYTHON_USEDEP}]
		>=dev-python/nh3-0.3.5[${PYTHON_USEDEP}]
		>=dev-python/django-simple-captcha-0.6.2[${PYTHON_USEDEP}]
		>=dev-python/webauthn-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.4.6[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.17.1[${PYTHON_USEDEP}]
		>=dev-python/cryptography-46[${PYTHON_USEDEP}]
		>=dev-python/dj-database-url-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/django-cache-url-3.4.5[${PYTHON_USEDEP}]
		>=dev-python/django-debug-toolbar-4.3.0[${PYTHON_USEDEP}]
		>=dev-python/django-htmx-1.17.3[${PYTHON_USEDEP}]
		>=dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-12.2.0[${PYTHON_USEDEP}]
		>=dev-python/pycountry-23.12.11[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.7.1[${PYTHON_USEDEP}]
		>=dev-python/pyld-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pymemcache-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.9.0_p0[${PYTHON_USEDEP}]
		>=dev-python/pywebpush-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/redis-7.4[${PYTHON_USEDEP}]
		>=dev-python/rq-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.29.0[${PYTHON_USEDEP}]
		>=dev-python/whitenoise-6.6.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="${PYTHON_DEPS}"

RESTRICT="test"

src_install() {
	insinto /opt/neodb
	doins -r neodb takahe misc
	python_fix_shebang "${ED}/opt/neodb"
	dodoc README.md FEDERATION.md SECURITY.md
}

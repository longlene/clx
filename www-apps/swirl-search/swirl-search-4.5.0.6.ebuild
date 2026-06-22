# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

inherit python-single-r1

DESCRIPTION="AI-powered RAG search platform integrating 100+ data source connectors"
HOMEPAGE="
	https://github.com/swirlai/swirl-search
	https://swirlaiconnect.com/
"
SRC_URI="https://github.com/swirlai/swirl-search/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="elasticsearch opensearch"
RESTRICT="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		>=dev-python/django-4.2[${PYTHON_USEDEP}]
		dev-python/djangorestframework[${PYTHON_USEDEP}]
		dev-python/celery[${PYTHON_USEDEP}]
		dev-python/channels[${PYTHON_USEDEP}]
		dev-python/channels-redis[${PYTHON_USEDEP}]
		dev-python/redis[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/nltk[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/whitenoise[${PYTHON_USEDEP}]
		dev-python/spacy[${PYTHON_USEDEP}]
		elasticsearch? ( dev-python/elasticsearch[${PYTHON_USEDEP}] )
	')
"
BDEPEND="${PYTHON_DEPS}"

src_install() {
	local dest="/usr/share/${PN}"
	insinto "${dest}"
	doins -r swirl swirl_server manage.py swirl.py requirements.txt
	fperms 0755 "${dest}/manage.py" "${dest}/swirl.py"
	insinto "${dest}/SearchProviders"
	doins -r SearchProviders/.
	insinto "${dest}/Data"
	doins -r Data/. 2>/dev/null || true
	dodoc README.md
	dodoc -r docs/
	python_optimize "${ED}${dest}/swirl" "${ED}${dest}/swirl_server"
}

pkg_postinst() {
	elog "SWIRL is installed to /usr/share/${PN}."
	elog "Before first use, configure /usr/share/${PN}/.env and run:"
	elog "  cd /usr/share/${PN} && python manage.py migrate"
	elog "  python manage.py createsuperuser"
	elog ""
	elog "Additional Python deps not in Gentoo tree must be installed via pip:"
	elog "  pip install daphne django-celery-beat django-environ drf-spectacular"
	elog "  pip install litellm openai transformers"
}

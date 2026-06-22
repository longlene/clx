# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Programmatically author, schedule and monitor data pipelines"
HOMEPAGE="https://airflow.apache.org/ https://github.com/apache/airflow"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# apache-airflow 3.x is a pure meta-package (no code — packages=[]).
# The two required sub-packages are not yet in portage:
#   dev-python/apache-airflow-core==3.2.2
#   dev-python/apache-airflow-task-sdk==1.2.2
# 80+ optional provider extras (celery, postgres, google, kubernetes, etc.)
# are each a separate PyPI package (apache-airflow-providers-*), none packaged.

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/apache-airflow-core[${PYTHON_USEDEP}]
		dev-python/apache-airflow-task-sdk[${PYTHON_USEDEP}]
	')
"

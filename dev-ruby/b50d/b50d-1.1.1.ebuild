# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby classes for my web apps to use, to access the PostgreSQL APIs"
HOMEPAGE="https://github.com/50pop/db-api"

LICENSE="CC BY-NC"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""



# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Stores Vines user data in an SQL database"
HOMEPAGE="http://www.getvines.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.2.13"
ruby_add_rdepend ">=dev-ruby/vines-0.4.5"
ruby_add_rdepend ">=dev-ruby/minitest-4.7.4"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.7"


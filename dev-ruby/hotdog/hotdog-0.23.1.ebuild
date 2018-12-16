# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Yet another command-line tool for Datadog"
HOMEPAGE="https://github.com/yyuu/hotdog"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/dogapi-0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/oj-0"
ruby_add_rdepend ">=dev-ruby/parallel-0"
ruby_add_rdepend ">=dev-ruby/parslet-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"


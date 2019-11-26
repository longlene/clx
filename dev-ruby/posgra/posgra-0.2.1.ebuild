# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Posgra is a tool to manage PostgreSQL roles/permissions"
HOMEPAGE="https://github.com/winebarrel/posgra"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/term-ansicolor-0"
ruby_add_rdepend ">=dev-ruby/hashie-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/unindent-0"
ruby_add_rdepend ">=dev-ruby/timecop-0"


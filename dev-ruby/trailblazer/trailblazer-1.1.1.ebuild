# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A high-level, modular architecture for Ruby framworks with domain and form objects, view models, twin decorators and representers"
HOMEPAGE="http://trailblazer.to"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/uber-0.0.15"
ruby_add_rdepend ">=dev-ruby/reform-2.0.0"
ruby_add_rdepend ">=dev-ruby/declarative-0"
ruby_add_rdepend ">=dev-ruby/activemodel-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0"
ruby_add_rdepend ">=dev-ruby/roar-0"


# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An awesome nested set implementation for Active Record"
HOMEPAGE="http://github.com/collectiveidea/awesome_nested_set"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.5.0"
ruby_add_rdepend ">=dev-ruby/rake-10"
ruby_add_rdepend ">=dev-ruby/combustion-0.5.2"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0"


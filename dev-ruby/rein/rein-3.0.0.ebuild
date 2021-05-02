# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rein adds bunch of methods to your ActiveRecord migrations so you can easily tame your database"
HOMEPAGE="http://github.com/nullobject/rein"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.0.0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.0.0"
ruby_add_rdepend ">=dev-ruby/appraisal-2.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.14"
ruby_add_rdepend ">=dev-ruby/pg-0.20"
ruby_add_rdepend ">=dev-ruby/rake-12.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.5"
ruby_add_rdepend ">=dev-ruby/rubocop-0.47"


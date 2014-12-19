# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Oracle "enhanced" ActiveRecord adapter contains useful additional methods for working with new and legacy Oracle databases"
HOMEPAGE="http://github.com/rsim/oracle-enhanced"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jeweler-1.8"
ruby_add_rdepend ">=dev-ruby/rspec-2.4"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/activerecord-0"
ruby_add_rdepend ">=dev-ruby/activemodel-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/actionpack-0"
ruby_add_rdepend ">=dev-ruby/railties-0"
ruby_add_rdepend ">=dev-ruby/arel-0"
ruby_add_rdepend ">=dev-ruby/journey-0"
ruby_add_rdepend ">=dev-ruby/activerecord-deprecated_finders-0"
ruby_add_rdepend ">=dev-ruby/ruby-plsql-0.5.0"
ruby_add_rdepend ">=dev-ruby/ruby-oci8-0"


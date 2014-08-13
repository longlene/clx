# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A datamapper plugin for active_model compliance and thus rails 3 compatibility"
HOMEPAGE="http://github.com/datamapper/dm-active_model"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dm-core-1.2.0"
ruby_add_rdepend ">=dev-ruby/activemodel-3.0"
ruby_add_rdepend ">=dev-ruby/dm-validations-1.2.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.6.4"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/rspec-1.3.2"
ruby_add_rdepend "=dev-ruby/test-unit-1.2.3"


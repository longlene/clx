# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Oracle Adapter for DataMapper"
HOMEPAGE="http://github.com/datamapper/dm-oracle-adapter"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/do_oracle-0.10.6"
ruby_add_rdepend ">=dev-ruby/dm-do-adapter-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-1.2.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.6.4"
ruby_add_rdepend ">=dev-ruby/rspec-1.3.2"


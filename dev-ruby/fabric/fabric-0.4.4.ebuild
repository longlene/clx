# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Fabric is a small ruby app to perform tasks on servers via SSH"
HOMEPAGE="http://github.com/setfire/fabric"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend "=dev-ruby/cucumber-0.6.1"
ruby_add_rdepend "=dev-ruby/rspec-1.2.9"
ruby_add_rdepend "=dev-ruby/database_cleaner-0.4.0"
ruby_add_rdepend "=dev-ruby/jeweler-1.4.0"
ruby_add_rdepend "=dev-ruby/net-ssh-2.0.15"
ruby_add_rdepend "=dev-ruby/dm-core-0.10.2"
ruby_add_rdepend "=dev-ruby/data_objects-0.10.0"
ruby_add_rdepend "=dev-ruby/do_sqlite3-0.10.0"


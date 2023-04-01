# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Oracle "enhanced" ActiveRecord adapter contains useful additional methods for working with new and legacy Oracle databases"
HOMEPAGE="http://github.com/rsim/oracle-enhanced"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-5.1.0"
ruby_add_rdepend ">=dev-ruby/arel-8.0"
ruby_add_rdepend ">=dev-ruby/ruby-plsql-0.6.0"


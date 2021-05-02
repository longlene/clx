# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    This is just an extraction from Ransack/Squeel"
HOMEPAGE="http://github.com/ernie/polyamorous"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.0"
ruby_add_rdepend ">=dev-ruby/machinist-1.0.6"
ruby_add_rdepend ">=dev-ruby/faker-0.9.5"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.3"


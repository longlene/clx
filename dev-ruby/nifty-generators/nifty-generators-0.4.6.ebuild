# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A collection of useful Rails generator scripts for scaffolding, layout files, authentication, and more"
HOMEPAGE="http://github.com/ryanb/nifty-generators"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-rails-2.0.1"
ruby_add_rdepend ">=dev-ruby/cucumber-0.9.2"
ruby_add_rdepend ">=dev-ruby/rails-3.0.0"
ruby_add_rdepend ">=dev-ruby/mocha-0.9.8"
ruby_add_rdepend ">=dev-ruby/bcrypt-ruby-2.1.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-ruby-1.3.1"


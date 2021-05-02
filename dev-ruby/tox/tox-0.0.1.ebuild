# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby interface for libtoxcore"
HOMEPAGE="https://github.com/toxon/tox.rb"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.13"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/rubocop-0.49.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.6"
ruby_add_rdepend ">=dev-ruby/simplecov-0.14"
ruby_add_rdepend ">=dev-ruby/yard-0.9"
ruby_add_rdepend ">=dev-ruby/rake-compiler-1.0"
ruby_add_rdepend ">=dev-ruby/faker-1.8"


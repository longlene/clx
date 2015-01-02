# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Automatic Ruby code style checking tool"
HOMEPAGE="http://github.com/bbatsov/rubocop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rainbow-1.99.1"
ruby_add_rdepend ">=dev-ruby/parser-2.1.9"
ruby_add_rdepend ">=dev-ruby/powerpack-0.0.6"
ruby_add_rdepend ">=dev-ruby/json-1.7.7"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-1.4"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0.7"


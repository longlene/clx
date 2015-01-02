# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sinatra integration for ZeroClipboard"
HOMEPAGE="https://github.com/ofeldt/sinatra-zero_clipboard"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rack-1.5.2"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.13.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.7.1"
ruby_add_rdepend ">=dev-ruby/slim-1.3.8"
ruby_add_rdepend ">=dev-ruby/pry-0.9.12.1"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4.2"


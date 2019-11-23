# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="HTTP(S) Intercept Proxy"
HOMEPAGE="https://github.com/argos83/ritm"

LICENSE="Apache License, v2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/faraday-0.9"
ruby_add_rdepend ">=dev-ruby/webrick-1.3"
ruby_add_rdepend ">=dev-ruby/certificate_authority-0.1.6"
ruby_add_rdepend ">=dev-ruby/dot_hash-0.5"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/rubocop-0.40"
ruby_add_rdepend ">=dev-ruby/simplecov-0.11"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/thin-1.6"
ruby_add_rdepend ">=dev-ruby/rake-11.1"
ruby_add_rdepend ">=dev-ruby/httpclient-2.8"

